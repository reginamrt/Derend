//
//  WardrobeNavigationLink.swift
//  Derend
//
//  Created by Maria Regina Taufik on 20/05/25.
//


import SwiftUI

struct WardrobeNavigationLink: View {
    @EnvironmentObject var derendVM: DerendViewModel

    var body: some View {
        NavigationLink(destination: ClosetPage()) {
            ZStack {
                Color.clear
                    .frame(width: 50, height: 120)
                
                VStack {
                    HStack(spacing: 4) {
                        Image(systemName: "cabinet.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 15, height: 15)
                        
                        Text("Wardrobe")
                            .font(.caption)
                    }
                    
                    Text("Change Look")
                        .italic()
                        .font(.caption)
                        .fontWeight(.light)
                        .foregroundStyle(.primary)
                }
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .background(
                    Color(hex: derendVM.isLightMode ? 0xa5c1d6 : 0x284172).opacity(0.7)
                )
                .foregroundColor(.primary)
                .cornerRadius(10)
                .offset(x: -30, y: -30)
                .shadow(color: .cyan, radius: 5, x: 0, y: 0)
            }
        }
        .offset(x: 131, y: 135)
    }
}
