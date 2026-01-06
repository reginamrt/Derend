//
//  RadioNavigationLink.swift
//  Derend
//
//  Created by Maria Regina Taufik on 20/05/25.
//


import SwiftUI

struct RadioNavigationLink: View {
    @EnvironmentObject var derendVM: DerendViewModel

    var body: some View {
        NavigationLink(destination: SongListView()) {
            ZStack {
                Color.clear
                    .frame(width: 50, height: 80)

                VStack {
                    HStack(spacing: 4) {
                        Image(systemName: "music.note.list")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 15, height: 15)
                        Text("Radio")
                            .font(.caption)
                    }

                    Text("Derend's Playlist")
                        .italic()
                        .font(.caption)
                        .fontWeight(.light)
                        .foregroundStyle(.primary)
                }
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .background(Color(hex: derendVM.isLightMode ? 0xa5c1d6 : 0x597295).opacity(0.7))
                .foregroundColor(.primary)
                .cornerRadius(10)
                .offset(x: -25, y: -15)
                .shadow(color: .cyan, radius: 5, x: 0, y: 0)
            }
        }
        .offset(x: 145, y: 20)
    }
}
