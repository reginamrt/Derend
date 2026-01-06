//
//  SongListView.swift
//  Derend
//
//  Created by Maria Regina Taufik on 15/05/25.
//

import SwiftUI
import MusicKit

struct SongListView: View {
    @EnvironmentObject var musicVM: MusicViewModel
    @EnvironmentObject var derendVM: DerendViewModel
    @State private var showFullPlayer = false
    @State private var selectedSong: PreloadedSong?
    
    var body: some View {
        ScrollView {
            if musicVM.preloadedSongs.isEmpty {
                Text("Loading songs...")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundColor(.primary)
                    .padding()
            } else {
                VStack(spacing: 10) {
                    ForEach(musicVM.preloadedSongs, id: \.song.id) { preloadedSong in
                        SongCards(
                            preloadedSong: preloadedSong,
                            onTap: {
                                selectedSong = preloadedSong
                                Task {
                                    await musicVM.play(preloadedSong: preloadedSong)
                                    showFullPlayer = true
                                }
                            }
                        )
                    }
                    Spacer()
                    Text ("""
                        
                        
                        You've reached the end of the playlist
                        
                        
                        """)
                    .foregroundColor(.primary)
                }
            }
        }
        .padding(.bottom, 20)
        .background(Color(hex: derendVM.isLightMode ? 0xa5c1d6 : 0x284172))
        .sheet(isPresented: $showFullPlayer) {
            NowPlayingView()
                .environmentObject(musicVM)
        }
    }
}


//import SwiftUI
//import MusicKit
//
//struct SongListView: View {
//    @EnvironmentObject var musicVM: MusicViewModel
//    @EnvironmentObject var derendVM: DerendViewModel
//    @State private var showFullPlayer = false
//    @State private var selectedSong: PreloadedSong?
//    
//    var body: some View {
//        ScrollView {
//            if musicVM.preloadedSongs.isEmpty {
//                Text("Loading songs...")
//                    .foregroundColor(.white)
//                    .padding()
//            } else {
//                VStack(spacing: 10) {
//                    ForEach(musicVM.preloadedSongs, id: \.song.id) { preloadedSong in
//                        SongCards(preloadedSong: preloadedSong, onTap: { ...})
//                    }
//                }
//                .padding(.vertical)
//            }
//        }
//        .background(Color(hex: derendVM.isLightMode ? 0xa5c1d6 : 0x284172))
//        .sheet(isPresented: $showFullPlayer) {
//            NowPlayingView(playbackQueue: ApplicationMusicPlayer.shared.queue)
//                .environmentObject(musicVM)
//        }
//
////        .sheet(isPresented: $showFullPlayer) {
////            if let song = selectedSong {
////                FullPlayerView(song: song)
////            } else {
////                Text("No song selected.")
////            }
////        }
//    }
//}
