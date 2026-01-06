//
//  StarterPackButton.swift
//  Derend
//
//  Created by Maria Regina Taufik on 20/05/25.
//


import SwiftUI

struct StarterPackButton: View {
    @EnvironmentObject var derendVM: DerendViewModel
    var action: () -> Void

    var body: some View {
        Button(action: {
            action()
        }) {
            ZStack(alignment: .trailing) {
                Color.clear
                    .frame(width: 125, height: 50)

                HStack(spacing: 4) {
                    Image(systemName: "backpack.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 15, height: 15)
                    Text("Starter Pack")
                        .font(.caption)
                }
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .background(Color(hex: derendVM.isLightMode ? 0xa5c1d6 : 0x597295).opacity(0.7))
                .foregroundColor(.primary)
                .cornerRadius(15)
                .shadow(color: .cyan, radius: 5, x: 0, y: 0)
            }
        }
        .position(x: 275, y: 275)
    }
}
