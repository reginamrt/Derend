//
//  NowPlayingView.swift
//  Derend
//
//  Created by Maria Regina Taufik on 20/05/25.
//

import MusicKit
import SwiftUI


struct NowPlayingView: View {
    @EnvironmentObject var musicVM: MusicViewModel
    @EnvironmentObject var derendVM: DerendViewModel
    
    var body: some View {
        ZStack{
            if let song = musicVM.nowPlayingItem {
                            DynamicArtworkBackground(song: song)
                        }
            VStack(spacing: 20) {
                Capsule()
                    .frame(width: 40, height: 5)
                    .foregroundColor(.gray.opacity(0.5))
                    .padding(.top)
                if let song = musicVM.nowPlayingItem {
                    // Use Song's artwork (MusicKit artwork)
                    if let artwork = song.artwork {
                        ArtworkImage(artwork, width: 200, height: 200)
                            .cornerRadius(12)
                            .shadow(radius: 5)
                    } else {
                        Rectangle()
                            .fill(Color.gray.opacity(0.3))
                            .frame(width: 200, height: 200)
                            .cornerRadius(12)
                    }
                    
                    // Title and Artist from Song
                    Text(song.title)
                        .font(.title2)
                        .bold()
                        .lineLimit(1)
                    Text(song.artistName)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .lineLimit(1)
                    
                    // Playback Controls
                    HStack(spacing: 60) {
                        
                        Button(action: {
                            Task {
                                await musicVM.togglePlayback()
                            }
                        }) {
                            Image(systemName: musicVM.isPlaying ? "pause.circle.fill" : "play.circle.fill")
                                .font(.system(size: 50))
                                .foregroundColor(.primary)
                        }
                    }
                    .padding(.top, 15)
                    if let lyrics = musicVM.selectedItem?.lyrics {
                        ScrollView {
                            Text(lyrics)
                                .font(.title3)
                                .fontWeight(.medium)
                                .foregroundColor(.primary)
                                .frame(maxWidth: 250, maxHeight: .infinity)
                                .padding()
                                .background(Color.secondary.opacity(0.1))
                                .cornerRadius(12)
                        }
                    } else {
                        Text("Lyrics not available")
                            .font(.title3)
                            .fontWeight(.medium)
                            .foregroundColor(.secondary)
                            .frame(maxWidth: 250, maxHeight: .infinity)
                            .padding()
                            .background(Color.secondary.opacity(0.5))
                            .cornerRadius(12)
                    }
                    
                } else {
                    Text("No song playing")
                        .foregroundColor(.secondary)
                }
                Spacer()
            }
            .padding()
//            .background(Color(hex: derendVM.isLightMode ? 0xa5c1d6 : 0x284172))
        }
    }
}



/// A SwiftUI view that displays information about the currently playing song and queue.
//struct NowPlayingView: View {
//    
//    // MARK: - Properties
//    
//    @ObservedObject var playbackQueue: ApplicationMusicPlayer.Queue
//    
//    // MARK: - View
//    
//    var body: some View {
//        NavigationView {
//            content
//                .navigationTitle("Now Playing")
//        }
//    }
//    
//    @ViewBuilder
//    private var content: some View {
//        list(for: playbackQueue)
//    }
//    
//    private func list(for playbackQueue: ApplicationMusicPlayer.Queue) -> some View {
//        List {
//            ForEach(playbackQueue.entries) { entry in
//                MusicItemCell(
//                    artwork: entry.artwork,
//                    artworkSize: 44,
//                    artworkCornerRadius: 4,
//                    title: entry.title,
//                    subtitle: entry.subtitle,
//                    subtitleVerticalOffset: -2.0
//                )
//            }
//        }
//        .animation(.default, value: playbackQueue.entries)
//        }
//    }
    
