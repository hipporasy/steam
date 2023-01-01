//
//  Color+Extension.swift
//  Steam
//
//  Created by Marasy Phi on 28/12/22.
//

import SwiftUI

extension Color {
    static let primaryColor = Color.init(hex: 0x31BCFC)
    static let accentColor = Color.init(hex: 0x303649)
    static let primaryBackground = Color.init(hex: 0x1C202C)
    static let secondaryBackground = Color.init(hex: 0x171A24)
    static let secondaryDark = Color.init(hex: 0x202532)
    static let secondaryColor = Color.init(hex: 0x12141C)
    static let lightText = Color.init(hex: 0xFFFFFF)
    static let darkText = Color.init(hex: 0x7B8D9D)
    static let primaryGreen = Color.init(hex: 0x4DC992)
    
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
    
}


