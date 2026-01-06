//
//  FunFactCard.swift
//  Derend
//
//  Created by Maria Regina Taufik on 20/05/25.
//


import SwiftUI

struct FunFactCard: View {
    @State var funFact : String = "Click here to see fun facts about Derend"
    @EnvironmentObject var derendVM: DerendViewModel

    var body: some View {
        Group {
            Text(funFact)
                .font(.caption)
                .fontWeight(.light)
                .foregroundColor(.primary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 30)
                .padding(.top, 10)
                .padding()
                .cornerRadius(25)
                .frame(maxWidth: 500, maxHeight: 100)
                .background(Color(hex: derendVM.isLightMode ? 0xa5c1d6 : 0x284172).opacity(0.7))
                .shadow(color: .cyan, radius: 5, x: 0, y: 0)
            
            Button(action: {
                funFact = information.funFacts.randomElement() ?? funFact
            }) {
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color(hex: derendVM.isLightMode ? 0xa5c1d6 : 0x284172).opacity(0.9))
                        .frame(height: 44)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.white, lineWidth: 3)
                        )
                        .offset(x: -75, y: -50)

                    Text("Fun Facts")
                        .font(.body)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                        .offset(x: -50, y: -50)

                    Image("DerChibiButton")
                        .resizable()
                        .frame(width: 110, height: 110)
                        .rotationEffect(Angle(degrees: -15))
                        .offset(x: -150, y: -57)
                }
            }
        }
        .offset(x: 0, y: 300)
    }
}
