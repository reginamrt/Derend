//
//  ContentView.swift
//  Derend
//
//  Created by Maria Regina Taufik on 08/05/25.
//

import SwiftUI
    
struct ContentView: View {
    //    @State var selectedVariant: Int = 0
    //    @State var derIndex: Int = 0
    @EnvironmentObject var musicVM: MusicViewModel
    @EnvironmentObject var derendVM: DerendViewModel
    @State private var funFact : String = "click here to see fun facts about Derend"
    @State private var showNowPlaying = false
    @State private var isShowingPopup: Bool = false
    
    var derend: [String] = ["DerGuitar", "DerTech", "DerPDD", "DerSoccer", "DerMarvel", "DerChess"]
    
    @ViewBuilder
    private var popupOverlay: some View {
        if isShowingPopup {
            ZStack {
                Color.secondary.opacity(1)
                    .ignoresSafeArea()
                    .blur(radius: 5)
                    .onTapGesture {
                        withAnimation {
                            isShowingPopup = false
                        }
                    }

                PopupView(isPresented: $isShowingPopup)
                    .frame(maxWidth: 320, maxHeight: 400)
                    .cornerRadius(20)
                    .shadow(radius: 20)
                    .transition(.scale)
            }
            .transition(.opacity)
            .zIndex(1)
        }
    }
    
    var body: some View {
        ZStack {
            NavigationStack {
                ZStack(alignment: .bottom) {
                    LinearGradient(
                        gradient: Gradient(colors: [
                            Color(hex: derendVM.isLightMode ? 0xa5c1d6 : 0x597295), // top
                            Color(hex: derendVM.isLightMode ? 0xd7b7a2 : 0x766b74)  // bottom
                        ]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .ignoresSafeArea()
                    
                    ScrollView {
                        VStack {
                            ZStack {
                                Image(derendVM.isLightMode ? "DerendRoomBgLight" : "DerendRoomBgDark")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                Image(derend[derendVM.derIndex])
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 350, height: 500)
                                    .offset(x: -15, y: 70)
                                
                                LightModeToggleButton()
                                
                                DesktopNavigationLink()
                                
                                WardrobeNavigationLink()
                                
                                RadioNavigationLink()
                                FunFactCard()
                                Button(action: {
                                    isShowingPopup = true
                                }) {
                                    ZStack(alignment:.trailing){
                                        Color.clear
                                            .frame(width: 125, height: 50)
                                        HStack(spacing: 4) {
                                            Image(systemName: "backpack.fill")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 15, height: 15)
                                            Text("Starter Pack")
                                                .font(.caption)
                                        }
                                        .padding(.horizontal, 8)
                                        .padding(.vertical, 4)
                                        .background(Color(hex: derendVM.isLightMode ? 0xa5c1d6 : 0x597295).opacity(0.7))
                                        .foregroundColor(.primary)
                                        .cornerRadius(15)
                                        .shadow(color: .cyan, radius: 5, x: 0, y: 0)
                                    }
                                }
                                .position(x: 275, y: 275)
                            }
                        }
                        .navigationTitle(Text("Derend's Room"))
                        .navigationBarTitleDisplayMode(.automatic)
                    }
                    .ignoresSafeArea(edges: .all)
                }
            }
            .preferredColorScheme(derendVM.isLightMode ? .light : .dark)
            }
        .overlay(popupOverlay)
    }
}

#Preview {
    ContentView()
        .environmentObject(MusicViewModel.shared)
        .environmentObject(DerendViewModel())
}
