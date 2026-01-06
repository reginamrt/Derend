////
////  MainView.swift
////  Derend
////
////  Created by Maria Regina Taufik on 19/05/25.
////

import SwiftUI
import MusicKit

struct MainView: View {
    @StateObject private var musicVM = MusicViewModel.shared

    var body: some View {
        MusicOverlayContainer {
            NavigationStack {
                ContentView()
            }
        }
        .environmentObject(musicVM)
    }
}


#Preview {
    MainView()
        .environmentObject(MusicViewModel.shared)
        .environmentObject(DerendViewModel())
}
