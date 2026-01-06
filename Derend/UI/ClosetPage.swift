//
//  ClosetPage.swift
//  Derend
//
//  Created by Maria Regina Taufik on 09/05/25.
//

import SwiftUI

struct ClosetPage: View {
    @EnvironmentObject var derendVM: DerendViewModel
    @State var isLightMode: Bool = true
    
    var body: some View {
        NavigationStack {
            ScrollView{
                DerendClosetView(
                    derIndex: $derendVM.derIndex,
                    selectedVariant: $derendVM.selectedVariant
                )
                    .navigationTitle("Derend's Closet")
            }
            .background(Color(hex: derendVM.isLightMode ? 0xa5c1d6 : 0x284172))
        }
    }
}
#Preview {
    ClosetPage()
        .environmentObject(MusicViewModel.shared)
        .environmentObject(DerendViewModel())
}
