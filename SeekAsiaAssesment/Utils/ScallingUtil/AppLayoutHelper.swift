//
//  AppLayoutHelper.swift
//  SeekAsiaAssesment
//
//  Created by Syed Uzair - Work on 10/26/24.
//

import UIKit

// MARK: - Dimension Scaling
struct DimensionScale {
    
     static let adjustFactor: CGFloat = UIScreen.main.traitCollection.userInterfaceIdiom == .pad ? 0.65 : 1.0
     static let scaleFactorWidth: CGFloat = (UIScreen.main.bounds.width / 375.0) * adjustFactor
     static let scaleFactorHeight: CGFloat = UIScreen.main.bounds.height / 812.0
    
    
    static func height(_ value: CGFloat) -> CGFloat {
        return value * scaleFactorHeight
    }

    static func width(_ value: CGFloat) -> CGFloat {
        return value * scaleFactorWidth
    }
}

// MARK: - Color Utility
struct ColorPalette {
    static func color(for key: Color) -> UIColor {
        return UIColor(hexString: key.rawValue)
    }
}

// MARK: - Text Scaling
struct TextScale {
    static func size(_ size: CGFloat) -> CGFloat {
        return size * DimensionScale.scaleFactorWidth
    }
}
