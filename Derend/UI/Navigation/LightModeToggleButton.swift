//
//  LightModeToggleButton.swift
//  Derend
//
//  Created by Maria Regina Taufik on 20/05/25.
//

import SwiftUI


struct LightModeToggleButton: View {
    @EnvironmentObject var derendVM: DerendViewModel
    
    var body: some View {
        Button(action: {
            derendVM.isLightMode.toggle()
        }) {
            ZStack {
                Color.clear
                    .frame(width: 35, height: 120)
                    .offset(x: -30, y: 30)
                
                HStack(spacing: 4) {
                    Image(systemName: "sun.max.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 15, height: 15)
                    Text("Change Mode")
                        .font(.caption)
                }
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .background(Color(hex: derendVM.isLightMode ? 0xa5c1d6 : 0x597295).opacity(0.7))
                .foregroundColor(.primary)
                .cornerRadius(10)
                .offset(x: 20, y: 0)
                .shadow(color: .cyan, radius: 5, x: 0, y: 0)
            }
        }
        .offset(x: -148, y: -129)
    }
}
