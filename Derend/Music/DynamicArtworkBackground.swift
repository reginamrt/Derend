//
//  DynamicArtworkBackground.swift
//  Derend
//
//  Created by Maria Regina Taufik on 20/05/25.
//

import SwiftUI
import MusicKit

struct DynamicArtworkBackground: View {
    let song: Song
    
    var body: some View {
        ZStack {
            if let url = song.artwork?.url(width: 800, height: 800) {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .blur(radius: 40)
                        .opacity(0.4)
                        .ignoresSafeArea()
                } placeholder: {
                    Color.black.opacity(0.5)
                }
            } else {
                Color.black.opacity(0.5)
                    .ignoresSafeArea()
            }
        }
    }
}
