//
//  MusicViewModel.swift
//  Derend
//
//  Created by Maria Regina Taufik on 15/05/25.
//

import MusicKit
import SwiftUI

@MainActor
final class MusicViewModel: ObservableObject {
    static let shared = MusicViewModel()
    
    let player = ApplicationMusicPlayer.shared

    @Published var nowPlayingItem: Song?
    @Published var selectedItem: Item?
    @Published var preloadedSongs: [PreloadedSong] = []
    @Published var isPlaying: Bool = false

    private init() {
        Task {
            await preloadSongs()
        }
    }

    private func preloadSongs() async {
        do {
            let status = await MusicAuthorization.request()
            guard status == .authorized else {
                print("Not authorized")
                return
            }

            var loadedSongs: [PreloadedSong] = []

            for music in MockData.MusicData {
                if let songSearch = music.musicSearch, !songSearch.isEmpty {
                    var request = MusicCatalogSearchRequest(
                        term: songSearch,
                        types: [Song.self]
                    )
                    request.limit = 1

                    let response = try await request.response()

                    if let song = response.songs.first {
                        let preloadedSong = PreloadedSong(song: song, item: music)
                        loadedSongs.append(preloadedSong)
                    }
                }
            }

            preloadedSongs = loadedSongs
        } catch {
            print("Error preloading songs: \(error)")
        }
    }

    @MainActor
    func play(preloadedSong: PreloadedSong) async {
        do {
            player.queue = ApplicationMusicPlayer.Queue(for: [preloadedSong.song])
            try await player.play()
            selectedItem = preloadedSong.item
            nowPlayingItem = preloadedSong.song
            isPlaying = true
        } catch {
            print("Error playing song: \(error)")
        }
    }

    func togglePlayback() async {
        if isPlaying {
            player.pause()
            isPlaying = false
        } else {
            do {
                try await player.play()
                isPlaying = true
            } catch {
                print("Error resuming playback: \(error)")
            }
        }
    }

    @MainActor
    func skipToNext() async {
        try? await player.skipToNextEntry()
    }

    @MainActor
    func skipToPrevious() async {
        try? await player.skipToPreviousEntry()
    }
}

struct PreloadedSong {
    let song: Song
    let item: Item
}


//import MusicKit
//import SwiftUI
//
//@MainActor
//final class MusicViewModel: ObservableObject {
//    static let shared = MusicViewModel()
//    
//    let player = ApplicationMusicPlayer.shared
//
//    @Published var nowPlayingItem: Song?
//    @Published var selectedItem: Item?
//    @Published var preloadedSongs: [PreloadedSong] = []
//    @Published var isPlaying: Bool = false
//
//    private init() {
//        Task {
//            await preloadSongs()
//        }
//    }
//
//    private func preloadSongs() async {
//        do {
//            let status = await MusicAuthorization.request()
//            guard status == .authorized else {
//                print("Not authorized")
//                return
//            }
//
//            var loadedSongs: [PreloadedSong] = []
//
//            for music in MockData.MusicData {
//                if let songSearch = music.musicSearch, !songSearch.isEmpty {
//                    var request = MusicCatalogSearchRequest(
//                        term: songSearch,
//                        types: [Song.self]
//                    )
//                    request.limit = 1
//
//                    let response = try await request.response()
//
//                    if let song = response.songs.first {
//                        let preloadedSong = PreloadedSong(song: song, item: music)
//                        loadedSongs.append(preloadedSong)
//                    }
//                }
//            }
//
//            preloadedSongs = loadedSongs
//        } catch {
//            print("Error preloading songs: \(error)")
//        }
//    }
//
//    func playSong() async {
//        do {
//            try await player.play()
//            await MainActor.run { self.isPlaying = true }
//        } catch {
//            print("Error playing song: \(error)")
//        }
//    }
//
//    func stopSong() {
//        player.stop()
//        isPlaying = false
//    }
//
//    @MainActor
//    func play(preloadedSong: PreloadedSong) async {
//        do {
//            player.queue = ApplicationMusicPlayer.Queue(for: [preloadedSong.song])
//            try await player.play()
//            selectedItem = preloadedSong.item
//            isPlaying = true
//        } catch {
//            print("Error playing song: \(error)")
//        }
//    }
//
//    func togglePlayback() async {
//        if isPlaying {
//            player.pause()
//            isPlaying = false
//        } else {
//            do {
//                try await player.play()
//                isPlaying = true
//            } catch {
//                print("Error resuming playback: \(error)")
//            }
//        }
//    }
//
//    @MainActor
//    func togglePlayPause() async {
//        if player.state.playbackStatus == .playing {
//            player.pause()
//        } else {
//            try? await player.play()
//        }
//    }
//
//    @MainActor
//    func skipToNext() async {
//        try? await player.skipToNextEntry()
//    }
//
//    @MainActor
//    func skipToPrevious() async {
//        try? await player.skipToPreviousEntry()
//    }
//}
//
//struct PreloadedSong {
//    let song: Song
//    let item: Item
//}





