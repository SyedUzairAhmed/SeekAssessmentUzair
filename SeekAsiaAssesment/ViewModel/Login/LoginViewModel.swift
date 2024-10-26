//
//  LoginViewModel.swift
//  SeekAsiaAssesment
//
//  Created by Syed Uzair - Work on 10/26/24.
//

import UIKit


class LoginViewModel {
    
    func validateInput(username: String, password: String, viewController: BaseClass) -> Bool {
        guard !username.isEmpty else {
            viewController.showToast(title: GlobalValidation.emailIsEmptyMessage)
            return false
        }
        
        guard viewController.isValidEmail(testStr: username) else {
            viewController.showToast(title: GlobalValidation.emailValidationMessage)
            return false
        }
        
        guard !password.isEmpty else {
            viewController.showToast(title: GlobalValidation.passwordIsEmptyMessage)
            return false
        }
        
        return true
    }
}

