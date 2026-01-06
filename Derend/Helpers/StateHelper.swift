//
//  StateHelper.swift
//  Derend
//
//  Created by Maria Regina Taufik on 15/05/25.
//

import Foundation

class DerendViewModel: ObservableObject {
    @Published var derIndex: Int = 0
    @Published var selectedVariant: Int = 0
    @Published var isLightMode: Bool = true
}
