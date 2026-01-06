//
//  PopupView.swift
//  Derend
//
//  Created by Maria Regina Taufik on 20/05/25.
//

import SwiftUI
import Combine
import UIKit

struct PopupView: View {
    @Binding var isPresented: Bool
    @EnvironmentObject var derendVM: DerendViewModel

    var body: some View {
        VStack(spacing: 20) {
            Image("DerendChibi")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 350)
                .cornerRadius(20)
                .shadow(radius: 10)
            Text("Tap anywhere to dismiss")
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(derendVM.isLightMode ? .white : .black)
            
        }
    }
}
