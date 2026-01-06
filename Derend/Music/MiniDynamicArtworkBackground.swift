//
//  DynamicArtworkBackground.swift
//  Derend
//
//  Created by Maria Regina Taufik on 20/05/25.
//


//
//  DynamicArtworkBackground.swift
//  Derend
//
//  Created by Maria Regina Taufik on 20/05/25.
//

import SwiftUI
import MusicKit

struct MiniDynamicArtworkBackground: View {
    let song: Song
    
    var body: some View {
        ZStack {
            if let url = song.artwork?.url(width: 410, height: 80) {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .blur(radius: 40)
                        .frame(width: 410, height: 80)
                        .opacity(0.4)
                } placeholder: {
                    Color.primary.opacity(0.5)
                }
            } else {
                Color.primary.opacity(0.5)
            }
        }
    }
}
