//
//  Label.swift
//  SeekAsiaAssesment
//
//  Created by Syed Uzair - Work on 10/26/24.
//

import Foundation
import UIKit


extension UILabel {
    
    func setFontStyle(_ name: Font, _ size: CGFloat){
        self.font = UIFont(name: AppStyle.defaultFont + "-" + name.rawValue, size: TextScale.size(size))
    }
    
    func setFontColor(_ name:Color){
        self.textColor = UIColor(hexString: name.rawValue)
    }
    
}
