//
//  SongCards.swift
//  Derend
//
//  Created by Maria Regina Taufik on 09/05/25.
//

import SwiftUI
import MusicKit

struct SongCards: View {
    let preloadedSong: PreloadedSong
    var onTap: () -> Void
    
    func formatDuration(_ duration: TimeInterval?) -> String {
        guard let duration = duration else { return "Unknown" }
        let minutes = Int(duration) / 60
        let seconds = Int(duration) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }

    var body: some View {
        ZStack {
            Color.white
                .frame(width: 375, height: 80)
                .cornerRadius(10)
                .shadow(radius: 5)
                .opacity(0.1)
            HStack {
                Image(preloadedSong.item.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60)
                    .cornerRadius(10)
                    .padding(.leading, 5)
                VStack(alignment: .leading) {
                    Text(preloadedSong.item.title)
                        .font(.headline)
                    Text(preloadedSong.item.author ?? preloadedSong.song.artistName)
                        .font(.body)
                        .foregroundColor(.secondary)
                        .opacity(0.7)
                }
                .padding(.leading, 10)
                Spacer()
                Text(formatDuration(preloadedSong.song.duration))
                    .font(.body)
                    .foregroundColor(.secondary)
                    .padding(.trailing, 5)
            }
            .padding(.horizontal, 10)
        }
        .padding(.horizontal, 20)
        .onTapGesture {
            onTap()
        }
    }
}


//import SwiftUI
//import MusicKit
//
//struct SongCards: View {
//    let preloadedSong: PreloadedSong
//    var onTap: () -> Void
//    
//    func formatDuration(_ duration: TimeInterval?) -> String {
//        guard let duration = duration else { return "Unknown" }
//        let minutes = Int(duration) / 60
//        let seconds = Int(duration) % 60
//        return String(format: "%02d:%02d", minutes, seconds)
//    }
//
//    var body: some View {
//        ZStack {
//            Color.white
//                .frame(width: 375, height: 80)
//                .cornerRadius(10)
//                .shadow(radius: 5)
//                .opacity(0.1)
//            HStack {
//                Image(preloadedSong.item.imageName)
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .frame(width: 60, height: 60)
//                    .cornerRadius(10)
//                    .padding(.leading, 5)
//                VStack(alignment: .leading) {
//                    Text(preloadedSong.item.title)
//                        .font(.headline)
//                    Text(preloadedSong.item.author ?? preloadedSong.song.artistName)
//                        .font(.body)
//                        .foregroundColor(.secondary)
//                        .opacity(0.7)
//                }
//                .padding(.leading, 10)
//                Spacer()
//                Text(formatDuration(preloadedSong.song.duration))
//                    .font(.body)
//                    .foregroundColor(.secondary)
//                    .padding(.trailing, 5)
//            }
//            .padding(.horizontal, 10)
//        }
//        .padding(.horizontal, 20)
//        .onTapGesture {
//            onTap()
//        }
//    }
//}

//no

//import SwiftUI
//import MusicKit
//
//struct SongCards: View {
//    let preloadedSong: PreloadedSong
//    var onTap: () -> Void
//    
//    func formatDuration(_ duration: TimeInterval?) -> String {
//        guard let duration = duration else { return "Unknown" }
//        let minutes = Int(duration) / 60
//        let seconds = Int(duration) % 60
//        return String(format: "%02d:%02d", minutes, seconds)
//    }
//
//    var body: some View {
//        ZStack {
//            Color.white
//                .frame(width: 375, height: 80)
//                .cornerRadius(10)
//                .shadow(radius: 5)
//                .opacity(0.1)
//            HStack {
//                Image(preloadedSong.item.imageName)
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .frame(width: 60, height: 60)
//                    .cornerRadius(10)
//                    .padding(.leading, 5)
//                VStack(alignment: .leading) {
//                    Text(preloadedSong.item.title)
//                        .font(.headline)
//                    Text(preloadedSong.item.author ?? preloadedSong.song.artistName)
//                        .font(.body)
//                        .foregroundColor(.secondary)
//                        .opacity(0.7)
//                }
//                .padding(.leading, 10)
//                Spacer()
//                Text(formatDuration(preloadedSong.song.duration))
//                    .font(.body)
//                    .foregroundColor(.secondary)
//                    .padding(.trailing, 5)
//            }
//            .padding(.horizontal, 10)
//        }
//        .padding(.horizontal, 20)
//        .onTapGesture {
//            onTap()
//        }
//    }
//}


