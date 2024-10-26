//
//  BaseButton.swift
//  SeekAsiaAssesment
//
//  Created by Syed Uzair - Work on 10/25/24.
//

import Foundation
import UIKit


@IBDesignable class BaseButton: UIButton {
    
    // MARK: - Initializers
        override init(frame: CGRect) {
            super.init(frame: frame)
            commonInit()
        }
        
        required init?(coder: NSCoder) {
            super.init(coder: coder)
            commonInit()
        }
        
        private func commonInit() {
            self.layer.cornerRadius = 12
            self.backgroundColor = UIColor(hexString: Color.button.rawValue)
            self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
            setTitleColor(.white, for: .normal)
        }
        
        // MARK: - Customizable Properties

        @IBInspectable
        var btnTitle: String {
            set {
                setTitle(newValue, for: .normal)
            }
            get {
                return title(for: .normal) ?? ""
            }
        }

        @IBInspectable
        var fontColor: UIColor? {
            didSet {
                setTitleColor(fontColor, for: .normal)
            }
        }

//        // MARK: - Callbacks
//
//        var callBackAction: (() -> Void)?

//        // MARK: - Button Action
//
//        @IBAction func btnPressed(_ sender: UIButton) {
//            callBackAction?()
//        }
        
        override func layoutSubviews() {
            super.layoutSubviews()
        }
    }
