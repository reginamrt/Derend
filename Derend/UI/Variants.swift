//
//  Variants.swift
//  Derend
//
//  Created by Maria Regina Taufik on 14/05/25.
//

import SwiftUI

struct DerendClosetView: View {
    @Binding var derIndex: Int
    @Binding var selectedVariant: Int
    
    var derTitle: [String] = ["The Musician", "The Architect", "The Storyteller", "The Playmaker", "The Hero", "The Strategist"]
    var derImage: [String] = ["DerGuitar", "DerTech", "DerPDD", "DerSoccer", "DerMarvel", "DerChess"]
    var derDescription: [String] = ["Finds comfort in melodies and rhythm. Big on acoustic and pop rock. He plays guitar, sings, and dreams of producing his own music one day—creating not just sound, but feeling.", "Enjoys working with ideas and turning them into something real. Whether it’s writing lines of code, designing graphics, or building in 3D, he’s always creating.", "Sees stories in shapes, light, and space. Whether he’s behind a camera or designing, he captures details, emotions, and stories all at once.", "Loyal Chelsea supporter and longtime follower of the game. He said he likes Chelsea simply because their jerseys are blue, his favourite colour.", "Drawn to big worlds and layered characters. Marvel’s been a long-time favorite. He’s just as interested in how stories are made as the stories themselves.", "Analytical and strategic. Loves puzzles, systems, and figuring out how things work—whether it’s in chess, design, or life. His current ELO rating is 1400."]
    
    var body: some View {
        VStack{
            TabView(selection: $selectedVariant) {
                            ForEach(0..<derImage.count, id: \.self) { i in
                                Image(derImage[i])
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 300)
                                    .tag(i)
                            }
                        }
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                        .frame(height: 350)
            HStack(spacing: 8) {
                ForEach(0..<6) { index in
                    Circle()
                        .fill(index == selectedVariant ? Color.white : Color.gray)
                        .frame(width: 8, height: 8)
                        .animation(.easeInOut, value: selectedVariant)
                }
            }
            VStack(spacing: 16) {
                            Text("\(derTitle[selectedVariant])")
                                .font(.headline)

                            Text("\(derDescription[selectedVariant])")
                                .font(.caption)
                                .multilineTextAlignment(.center)
                                .padding()
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(10)

                Button(action: {
                    derIndex = selectedVariant
                }) {
                    Text(derIndex == selectedVariant ? "Selected" : "Select")
                        .padding(.vertical, 8)
                        .padding(.horizontal, 24)
                        .background(derIndex == selectedVariant ? Color.gray : Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .disabled(derIndex == selectedVariant)
                        }
                        .padding()
                    }
            }
        }

#Preview {
    RootView {
        ContentView()
            .environmentObject(MusicViewModel.shared)
            .environmentObject(DerendViewModel())
    }
}
