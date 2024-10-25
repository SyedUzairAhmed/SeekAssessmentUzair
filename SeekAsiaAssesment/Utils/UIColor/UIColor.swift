//
//  UIColor.swift
//  SeekAsiaAssesment
//
//  Created by Syed Uzair - Work on 10/26/24.
//

import Foundation
import UIKit

extension UIColor {
    
    convenience init(hexString: String) {
        let cleanHex = hexString.trimmingCharacters(in: .whitespacesAndNewlines)
            .replacingOccurrences(of: "#", with: "")
        
        let hex = cleanHex.uppercased()
        
        var rgbValue: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&rgbValue)
        
        var red: CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat = 0.0
        var alpha: CGFloat = 1.0
        
        switch hex.count {
        case 3: // RGB format
            red = CGFloat((rgbValue >> 8) & 0xF) / 15.0
            green = CGFloat((rgbValue >> 4) & 0xF) / 15.0
            blue = CGFloat(rgbValue & 0xF) / 15.0
        case 4: // RGBA format
            red = CGFloat((rgbValue >> 12) & 0xF) / 15.0
            green = CGFloat((rgbValue >> 8) & 0xF) / 15.0
            blue = CGFloat((rgbValue >> 4) & 0xF) / 15.0
            alpha = CGFloat(rgbValue & 0xF) / 15.0
        case 6: // RRGGBB format
            red = CGFloat((rgbValue >> 16) & 0xFF) / 255.0
            green = CGFloat((rgbValue >> 8) & 0xFF) / 255.0
            blue = CGFloat(rgbValue & 0xFF) / 255.0
        case 8: // RRGGBBAA format
            red = CGFloat((rgbValue >> 24) & 0xFF) / 255.0
            green = CGFloat((rgbValue >> 16) & 0xFF) / 255.0
            blue = CGFloat((rgbValue >> 8) & 0xFF) / 255.0
            alpha = CGFloat(rgbValue & 0xFF) / 255.0
        default:
            // Invalid hex string
            red = 0
            green = 0
            blue = 0
        }
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}
