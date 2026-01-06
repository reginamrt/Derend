//
//  MiniPlayerView.swift
//  Derend
//
//  Created by Maria Regina Taufik on 15/05/25.
//

import SwiftUI
import MusicKit

struct MiniPlayer: View {
    
    @ObservedObject var playbackQueue = ApplicationMusicPlayer.shared.queue
    let musicPlayer = ApplicationMusicPlayer.shared
    @EnvironmentObject var musicVM: MusicViewModel
    @EnvironmentObject var derendVM: DerendViewModel
    @Binding var showFullPlayer: Bool
    @State var isShowingNowPlaying = false
    @State var isShowingMusic = false
    
//    @State private var isShowingNowPlaying = false
//    @State private var isShowingMusic = false
    
    var body: some View {
        content
            .frame(height: 80)
            .frame(maxWidth: .infinity)
            .sheet(isPresented: $showFullPlayer) {
                NowPlayingView()
                    .environmentObject(musicVM)
            }
            .sheet(isPresented: $isShowingMusic) {
                NowPlayingView()
            }
            .background {
                ZStack {
                    if let song = musicVM.nowPlayingItem {
                        MiniDynamicArtworkBackground(song: song)
                            .cornerRadius(20)
                    } else {
                        Color.primary.opacity(0.5) // Fallback background
                    }

                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .fill(Color.clear)
                        .background(.ultraThinMaterial) // Optional: frosted glass effect
                        .padding([.leading, .trailing])
                        .shadow(radius: 8)
                }
            }
    }
    
    @ViewBuilder
    private var content: some View {
        if let currentPlayerEntry = playbackQueue.currentEntry {
            HStack {
                Button(action: handleTap) {
                    MusicItemCell(
                        artwork: currentPlayerEntry.artwork,
                        artworkSize: 64.0,
                        artworkCornerRadius: 12.0,
                        title: currentPlayerEntry.title,
                        subtitle: currentPlayerEntry.subtitle,
                        subtitleVerticalOffset: -4.0
                    )
                }
                Spacer()
                pauseButton
                    .foregroundColor(.primary)
                    .padding(.trailing, 10)
//                seeQueueView
            }
            .padding(.leading, 24)
            .padding(.trailing, 24)
        } else {
            Button(action: handleTap) {
                MusicItemCell(
                    artwork: nil,
                    artworkSize: 64.0,
                    artworkCornerRadius: 12.0,
                    title: "Nothing Playing",
                    subtitle: "Click here to explore music content",
                    subtitleVerticalOffset: -4.0
                )
            }
        }
    }
    
    var pauseButton: some View {
        Button(action: pausePlay) {
            Image(systemName: musicVM.isPlaying ? "pause.fill" : "play.fill")
                .foregroundColor(.primary)
        }
    }
    
//    var seeQueueView: some View {
//        Button {
//            isShowingNowPlaying = true
//        } label: {
//            Image(systemName: "list.bullet")
//                .font(.system(size: 18))
//                .foregroundColor(.black)
//        }
//    }
    
    // MARK: - Methods
    
    private func pausePlay() {
        if musicVM.isPlaying {
            musicPlayer.pause()
            musicVM.isPlaying = false
        } else {
            Task {
                try? await musicPlayer.play()
                musicVM.isPlaying = true
            }
        }
    }
    
    private func handleTap() {
        isShowingMusic = true
    }
}



//struct MiniPlayer: View {
//    
//    // MARK: - Properties
//    
//    @ObservedObject var playbackQueue = ApplicationMusicPlayer.shared.queue
//    let musicPlayer = ApplicationMusicPlayer.shared
//    @EnvironmentObject var musicVM: MusicViewModel
//        @Binding var showFullPlayer: Bool
//    @State var isShowingNowPlaying = false
//    @State var isShowingMusic = false
//    
//    
//    // MARK: - View
//    
//    var body: some View {
//        content
//            .frame(height: 80)
//            .frame(maxWidth: .infinity)
//            .sheet(isPresented: $isShowingNowPlaying) {
//                NowPlayingView(playbackQueue: playbackQueue)
//            }
//            .sheet(isPresented: $isShowingMusic) {
//                SongListView()
//            }
//            .background {
//                RoundedRectangle(cornerRadius: 20, style: .continuous)
//                    .fill(Color(UIColor.systemBackground))
//                    .padding([.leading, .trailing])
//                    .shadow(radius: 8)
//            }
//    }
//    
//    @ViewBuilder
//    private var content: some View {
//        if let currentPlayerEntry = playbackQueue.currentEntry {
//            HStack {
//                Button(action: handleTap) {
//                    MusicItemCell(
//                        artwork: currentPlayerEntry.artwork,
//                        artworkSize: 64.0,
//                        artworkCornerRadius: 12.0,
//                        title: currentPlayerEntry.title,
//                        subtitle: currentPlayerEntry.subtitle,
//                        subtitleVerticalOffset: -4.0
//                    )
//                }
//                Spacer()
//                pauseButton
//                seeQueueView
//            }
//            .padding(.leading, 24)
//            .padding(.trailing, 24)
//        } else {
//            Button(action: handleTap) {
//                MusicItemCell(
//                    artwork: nil,
//                    artworkSize: 64.0,
//                    artworkCornerRadius: 12.0,
//                    title: "Nothing Playing",
//                    subtitle: "Click here to explore music content",
//                    subtitleVerticalOffset: -4.0
//                )
//            }
//        }
//    }
//    
//    var pauseButton: some View {
//        Button(action: pausePlay) {
//            Image(systemName: (musicPlayer.isPlaying ? "pause.fill" : "play.fill"))
//                .foregroundColor(.black)
//        }
//    }
//    
//    var seeQueueView: some View {
//        Button {
//            isShowingNowPlaying = true
//        } label: {
//            Image(systemName: "list.bullet")
//                .font(.system(size: 18))
//                .foregroundColor(.black)
//        }
//    }
//    
//    // MARK: - Methods
//    
//    private func pausePlay() {
//        musicPlayer.togglePlaybackStatus()
//    }
//    
//    private func handleTap() {
//        isShowingMusic = true
//    }
//}

//struct MiniPlayerView: View {
//    @EnvironmentObject var musicVM: MusicViewModel
//    @Binding var showFullPlayer: Bool
//
//    var body: some View {
//        if let current = musicVM.nowPlayingItem {
//            VStack {
//                Spacer()
//                HStack {
//                    Text(current.title)
//                        .lineLimit(1)
//                        .font(.body)
//                    Spacer()
//                    Button(action: {
//                        Task {
//                            if musicVM.isPlaying {
//                                musicVM.stopSong()
//                            } else {
//                                await musicVM.playSong()
//                            }
//                        }
//                    }) {
//                        Image(systemName: musicVM.isPlaying ? "pause.fill" : "play.fill")
//                    }
//                    Button(action: {
//                        showFullPlayer = true
//                    }) {
//                        Image(systemName: "chevron.up")
//                    }
//                }
//                .padding()
//                .background(.ultraThinMaterial)
//                .cornerRadius(12)
//                .shadow(radius: 5)
//                .padding(.horizontal)
//            }
//            .transition(.move(edge: .bottom))
//            .animation(.easeInOut, value: musicVM.isPlaying)
//        }
//    }
//}
