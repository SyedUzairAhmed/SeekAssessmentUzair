//
//  LoginViewModel.swift
//  SeekAsiaAssesment
//
//  Created by Syed Uzair - Work on 10/26/24.
//

import UIKit
import Apollo
import BaseAPI

class LoginViewModel {
    
    private var userLoginService = UserLoginApiCall()
    var authUser: LoginModel?
    var errorMessage: String?
    
    init(userLoginService: UserLoginApiCall = UserLoginApiCall()) {
        self.userLoginService = userLoginService
    }
    
    func login(emailAddress: String, password: String, completion: @escaping () -> Void) {
        userLoginService.login(username: emailAddress, password: password) { [weak self] authUser, error in
            if let error = error {
                self?.errorMessage = error.localizedDescription
            } else {
                self?.authUser = authUser
                
                if let auth = authUser?.auth {
                    let data = Data(auth.utf8)
                    KeychainManager.shared.store(data: data,
                                                 for: KeychainConstants.keychainService,
                                                 account: KeychainConstants.keychainAccount)
                }
            }
            completion()
        }
    }
    
    
    func validateInput(username: String, password: String, viewController: BaseClass) -> Bool {
        guard !username.isEmpty else {
            viewController.showToast(title: GlobalValidation.emailIsEmptyMessage)
            return false
        }
        
        //        guard viewController.isValidEmail(testStr: username) else {
        //            viewController.showToast(title: GlobalValidation.emailValidationMessage)
        //            return false
        //        }
        
        guard !password.isEmpty else {
            viewController.showToast(title: GlobalValidation.passwordIsEmptyMessage)
            return false
        }
        
        return true
    }
    
}




