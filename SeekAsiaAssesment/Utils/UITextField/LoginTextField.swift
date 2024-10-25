//
//  LoginTextField.swift
//  SeekAsiaAssesment
//
//  Created by Syed Uzair - Work on 10/25/24.
//

import Foundation
import UIKit

@IBDesignable class LoginTextField: UITextField {
    
    private let borderLayer = CALayer()
    
    private var _isPasswordField: Bool = false
    
    private let defaultHeight: CGFloat = 50.0
    @IBInspectable var textPadding: CGFloat = 10.0
    
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
        setupBorder()
        self.borderStyle = .none
        self.layer.addSublayer(borderLayer)
        self.addTarget(self, action: #selector(didBeginEditing), for: .editingDidBegin)
        self.addTarget(self, action: #selector(didEndEditing), for: .editingDidEnd)
        
        self.frame.size.height = defaultHeight
        self.backgroundColor = UIColor(hexString: Color.backgroundSecondary.rawValue)
        self.layer.cornerRadius = 10
    }
    
    private func setupBorder() {
        borderLayer.borderColor = UIColor.gray.cgColor
        borderLayer.borderWidth = 1.0
        borderLayer.frame = bounds
        borderLayer.cornerRadius = 10
    }
    
    @objc private func didBeginEditing() {
        updateBorderColor(isActive: true)
    }
    
    @objc private func didEndEditing() {
        updateBorderColor(isActive: false)
    }
    
    private func updateBorderColor(isActive: Bool) {
        borderLayer.borderColor = isActive ? UIColor.purple.cgColor : UIColor.gray.cgColor
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        borderLayer.frame = bounds
    }
    
    // MARK: - Text Field Padding
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: textPadding, dy: 0)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: textPadding, dy: 0)
    }
    
    // MARK: - Customizable Properties
    
    @IBInspectable
    var placeholderText: String? {
        didSet {
            self.placeholder = placeholderText
        }
    }
    
    @IBInspectable
    var textFieldText: String? {
        didSet {
            self.text = textFieldText
        }
    }
    
    @IBInspectable
    var isPasswordField: Bool {
        get {
            return _isPasswordField
        }
        set {
            _isPasswordField = newValue
            self.isSecureTextEntry = newValue
        }
    }
    
    @IBInspectable
    var fontColor: UIColor? {
        didSet {
            self.textColor = fontColor
        }
    }
    
    @IBInspectable
    var fontSize: CGFloat = 17 {
        didSet {
            self.font = UIFont.systemFont(ofSize: fontSize)
        }
    }
}
