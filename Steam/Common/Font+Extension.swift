//
//  Font+Extension.swift
//  Steam
//
//  Created by Marasy Phi on 28/12/22.
//

import SwiftUI

extension Font {
    
    private static let _font = "Gilroy"
    
    enum `Type` : String {
        case medium
        case bold
        case heavy
        var fontName: String {
            return "\(_font)-\(self.rawValue.capitalized)"
        }
    }
    
    static func primary(_ type: `Type`, size: CGFloat = 15) -> Font {
        
        return .custom(type.fontName, size: size)
    }
    
}
