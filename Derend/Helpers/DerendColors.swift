//
//  DerendColors.swift
//  Derend
//
//  Created by Maria Regina Taufik on 20/05/25.
//

import SwiftUI

struct DerendColors {
    static func mainBackground(lightMode: Bool) -> Color {
        lightMode ? Color(hex: 0xa5c1d6) : Color(hex: 0x597295)
    }
    
    static func overlayBackground(lightMode: Bool) -> Color {
        lightMode ? Color(hex: 0xa5c1d6) : Color(hex: 0x284172)
    }
}
