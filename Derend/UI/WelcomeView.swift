//
//  WelcomeView.swift
//  Derend
//
//  Created by Maria Regina Taufik on 14/05/25.
//

import SwiftUI
import MusicKit

struct WelcomeView: View {
    
    @Binding var musicAuthorizationStatus: MusicAuthorization.Status
    @Environment(\.openURL) private var openURL
    
    var body: some View {
        ZStack {
            gradient
            VStack {
                Text("Derend's World")
                    .foregroundColor(.primary)
                    .font(.largeTitle.weight(.semibold))
                    .shadow(radius: 2)
                    .padding(.bottom, 1)
                Text("Welcome to Derend's World")
                    .foregroundColor(.primary)
                    .font(.title2.weight(.medium))
                    .multilineTextAlignment(.center)
                    .shadow(radius: 1)
                    .padding(.bottom, 16)
                explanatoryText
                    .foregroundColor(.primary)
                    .font(.title3.weight(.medium))
                    .multilineTextAlignment(.center)
                    .shadow(radius: 1)
                    .padding([.leading, .trailing], 32)
                    .padding(.bottom, 16)
                if let secondaryExplanatoryText = self.secondaryExplanatoryText {
                    secondaryExplanatoryText
                        .foregroundColor(.primary)
                        .font(.title3.weight(.medium))
                        .multilineTextAlignment(.center)
                        .shadow(radius: 1)
                        .padding([.leading, .trailing], 32)
                        .padding(.bottom, 16)
                }
                if musicAuthorizationStatus == .notDetermined || musicAuthorizationStatus == .denied {
                    Button(action: handleButtonPressed) {
                        buttonText
                            .padding([.leading, .trailing], 10)
                    }
                    .buttonStyle(.borderedProminent)
                    .colorScheme(.light)
                }
            }
            .colorScheme(.dark)
        }
    }
    
    private var gradient: some View {
        LinearGradient(
            gradient: Gradient(colors: [
                Color(red: (130.0 / 255.0), green: (109.0 / 255.0), blue: (204.0 / 255.0)),
                Color(red: (130.0 / 255.0), green: (130.0 / 255.0), blue: (211.0 / 255.0)),
                Color(red: (131.0 / 255.0), green: (160.0 / 255.0), blue: (218.0 / 255.0))
            ]),
            startPoint: .leading,
            endPoint: .trailing
        )
        .flipsForRightToLeftLayoutDirection(false)
        .ignoresSafeArea()
    }
    
    private var explanatoryText: Text {
        let explanatoryText: Text
        switch musicAuthorizationStatus {
            case .restricted:
                explanatoryText = Text("This app cannot be used on this iPhone because usage of ")
                    + Text(Image(systemName: "applelogo")) + Text(" Music is restricted.")
            default:
                explanatoryText = Text("This app uses ")
                    + Text(Image(systemName: "applelogo")) + Text(" Music\nfor the best experience.")
        }
        return explanatoryText
    }
    
    private var secondaryExplanatoryText: Text? {
        var secondaryExplanatoryText: Text?
        switch musicAuthorizationStatus {
            case .denied:
                secondaryExplanatoryText = Text("Please grant Music Albums access to ")
                    + Text(Image(systemName: "applelogo")) + Text(" Music in Settings.")
            default:
                break
        }
        return secondaryExplanatoryText
    }
    
    private var buttonText: Text {
        let buttonText: Text
        switch musicAuthorizationStatus {
            case .notDetermined:
                buttonText = Text("Continue")
            case .denied:
                buttonText = Text("Open Settings")
            default:
                fatalError("No button should be displayed for current authorization status: \(musicAuthorizationStatus).")
        }
        return buttonText
    }
    
    private func handleButtonPressed() {
        switch musicAuthorizationStatus {
            case .notDetermined:
                Task {
                    let musicAuthorizationStatus = await MusicAuthorization.request()
                    await update(with: musicAuthorizationStatus)
                }
            case .denied:
                if let settingsURL = URL(string: UIApplication.openSettingsURLString) {
                    openURL(settingsURL)
                }
            default:
                fatalError("No button should be displayed for current authorization status: \(musicAuthorizationStatus).")
        }
    }
    
    @MainActor
    private func update(with musicAuthorizationStatus: MusicAuthorization.Status) {
        withAnimation {
            self.musicAuthorizationStatus = musicAuthorizationStatus
        }
    }
    
    class PresentationCoordinator: ObservableObject {
        static let shared = PresentationCoordinator()
        
        private init() {
            let authorizationStatus = MusicAuthorization.currentStatus
            musicAuthorizationStatus = authorizationStatus
            isWelcomeViewPresented = (authorizationStatus != .authorized)
        }
        
        @Published var musicAuthorizationStatus: MusicAuthorization.Status {
            didSet {
                isWelcomeViewPresented = (musicAuthorizationStatus != .authorized)
            }
        }
        
        @Published var isWelcomeViewPresented: Bool
    }
    
    fileprivate struct SheetPresentationModifier: ViewModifier {
        @StateObject private var presentationCoordinator = PresentationCoordinator.shared
        
        func body(content: Content) -> some View {
            content
                .sheet(isPresented: $presentationCoordinator.isWelcomeViewPresented) {
                    WelcomeView(musicAuthorizationStatus: $presentationCoordinator.musicAuthorizationStatus)
                        .interactiveDismissDisabled()
                }
        }
    }
}

extension View {
    func welcomeSheet() -> some View {
        modifier(WelcomeView.SheetPresentationModifier())
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView(musicAuthorizationStatus: .constant(.notDetermined))
    }
}
