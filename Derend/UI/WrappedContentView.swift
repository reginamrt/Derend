//
//  WrappedContentView.swift
//  Derend
//
//  Created by Maria Regina Taufik on 15/05/25.
//


import SwiftUI

struct WrappedContentView: View {
    @StateObject private var musicVM = MusicViewModel.shared
    @StateObject var derendVM = DerendViewModel()

    var body: some View {
        MainView()
            .environmentObject(musicVM)
            .environmentObject(derendVM)
            .welcomeSheet()
    }
}
