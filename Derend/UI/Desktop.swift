//
//  Desktop.swift
//  Derend
//
//  Created by Maria Regina Taufik on 15/05/25.
//

import SwiftUI

struct Desktop: View {
    @EnvironmentObject var derendVM: DerendViewModel
    var body: some View {
        NavigationStack{
                ScrollView{
                    ZStack(alignment: .top){
                        Image("Desktop")
                            .resizable()
                            .aspectRatio(contentMode:.fit)
                            .padding()
                            .shadow(radius: 5)
                }
            }
            .background(Color(hex: derendVM.isLightMode ? 0xa5c1d6 : 0x516094))
            .navigationTitle(Text("Derend's Desktop"))
            .navigationBarTitleDisplayMode(.automatic)
        }
    }
}

#Preview {
    Desktop()
        .environmentObject(MusicViewModel.shared)
        .environmentObject(DerendViewModel())
}
