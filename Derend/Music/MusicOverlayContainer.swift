//
//  MusicOverlayContainer.swift
//  Derend
//
//  Created by Maria Regina Taufik on 20/05/25.
//


import SwiftUI
import MusicKit

struct MusicOverlayContainer<Content: View>: View {
    @State private var showFullPlayer = false
    @EnvironmentObject var musicVM: MusicViewModel

    let content: () -> Content

    var body: some View {
        ZStack(alignment: .bottom) {
            content()

            if musicVM.nowPlayingItem != nil {
                MiniPlayer(showFullPlayer: $showFullPlayer)
                    .padding(.bottom, 8)
                    .transition(.move(edge: .bottom))
                    .animation(.easeInOut, value: musicVM.nowPlayingItem)
            }
        }
        .sheet(isPresented: $showFullPlayer) {
            NowPlayingView()
                .environmentObject(musicVM)
        }
    }
}

