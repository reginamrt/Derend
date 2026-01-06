//
//  DesktopNavigationLink.swift
//  Derend
//
//  Created by Maria Regina Taufik on 20/05/25.
//


import SwiftUI

struct DesktopNavigationLink: View {
    @EnvironmentObject var derendVM: DerendViewModel
    
    var body: some View {
        NavigationLink(destination: Desktop()) {
            ZStack {
                Color.clear
                    .frame(width: 50, height: 75)
                
                VStack {
                    HStack(spacing: 4) {
                        Image(systemName: "desktopcomputer")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 15, height: 15)
                        
                        Text("Desktop")
                            .font(.caption)
                    }
                    
                    Text("Derend's Profile")
                        .italic()
                        .font(.caption)
                        .fontWeight(.light)
                        .foregroundStyle(.primary)
                }
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .background(
                    Color(hex: derendVM.isLightMode ? 0xa5c1d6 : 0x597295).opacity(0.8)
                )
                .foregroundColor(.primary)
                .cornerRadius(10)
                .offset(x: 45, y: -20)
                .shadow(color: .cyan, radius: 5, x: 0, y: 0)
            }
        }
        .offset(x: -170, y: 30)
    }
}
