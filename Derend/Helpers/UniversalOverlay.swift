//
//  UniversalOverlay.swift
//  Derend
//
//  Created by Maria Regina Taufik on 12/05/25.
//

import SwiftUI

extension UIImage {
    var prominentColor: UIColor? {
        guard let inputImage = CIImage(image: self) else { return nil }
        let extentVector = CIVector(x: inputImage.extent.origin.x, y: inputImage.extent.origin.y, z: inputImage.extent.size.width, w: inputImage.extent.size.height)

        guard let filter = CIFilter(name: "CIAreaAverage", parameters: [kCIInputImageKey: inputImage, kCIInputExtentKey: extentVector]) else { return nil }
        guard let outputImage = filter.outputImage else { return nil }

        var bitmap = [UInt8](repeating: 0, count: 4)
        let context = CIContext()
        context.render(outputImage, toBitmap: &bitmap, rowBytes: 4, bounds: CGRect(x: 0, y: 0, width: 1, height: 1), format: .RGBA8, colorSpace: nil)

        return UIColor(red: CGFloat(bitmap[0]) / 255, green: CGFloat(bitmap[1]) / 255, blue: CGFloat(bitmap[2]) / 255, alpha: CGFloat(bitmap[3]) / 255)
    }
}

extension View {
    func universalOverlay<Content:View>(animation:Animation = .snappy,show:Binding<Bool>, @ViewBuilder content: @escaping() -> Content) -> some View {
        self
            .modifier(UniversalOverlayModifier(animation: animation, show: show, viewContent: content))
    }
}

struct RootView<Content:View>: View {
    var content: Content
    init(@ViewBuilder content: @escaping() -> Content){
        self.content = content()
    }
    var properties = UniversalOverlayProperties()
    var body: some View {
        content
            .environment(properties)
            .onAppear{
                if let windowScene = (UIApplication.shared.connectedScenes.first as? UIWindowScene), properties.window == nil {
                    let window = PassThroughWindow(windowScene:windowScene)
                    window.isHidden = false
                    window.isUserInteractionEnabled = true
                    
                    let rootViewController = UIHostingController(rootView:UniversalOverlayViews().environment(properties))
                    rootViewController.view.backgroundColor = .clear
                    window.rootViewController = rootViewController
                    
                    properties.window = window
                }
            }
    }
}

@Observable
class UniversalOverlayProperties {
    var window: UIWindow?
    var views: [OverlayView] = []
    
    struct OverlayView: Identifiable {
        var id: String = UUID().uuidString
        var view: AnyView
    }
}

fileprivate struct UniversalOverlayModifier<ViewContent:View> : ViewModifier {
    var animation:Animation
    @Binding var show:Bool
    @ViewBuilder var viewContent: ViewContent
    
    @Environment(UniversalOverlayProperties.self) private var properties
    @State private var viewID: String?
    
    func body(content: Content) -> some View {
        content
            .onChange(of: show) { oldValue, newValue in
                if newValue {
                    addView()
                } else {
                    removeView()
                }
            }
    }
        private func addView() {
            if properties.window != nil && viewID == nil {
                viewID = UUID().uuidString
                guard let viewID else { return }
                
                withAnimation(animation) {
                    properties.views.append(.init(id: viewID, view: .init(viewContent)))
                }
            }
            
        }
        private func removeView() {
            if let viewID {
                withAnimation(animation){
                    properties.views.removeAll(where: {$0.id == viewID})
                }
                self.viewID = nil
            }
        }
}

fileprivate struct UniversalOverlayViews: View {
    @Environment(UniversalOverlayProperties.self) private var properties
    var body: some View {
        ZStack {
            ForEach(properties.views) {
                $0.view
            }
        }
    }
}

fileprivate class PassThroughWindow: UIWindow{
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        guard let hitView = super.hitTest(point, with: event),
                let rootView = rootViewController?.view
        else {return nil}
        
        if #available(iOS 18, *) {
            for subview in rootView.subviews.reversed() {
                let pointInSubview = subview.convert(point, from: rootView)
                if subview.hitTest(pointInSubview, with: event) == subview {
                    return hitView
                }
            }
            return nil
        } else {
            return hitView == rootView ? nil : hitView
        }
    }
}
