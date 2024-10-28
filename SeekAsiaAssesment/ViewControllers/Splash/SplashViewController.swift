//
//  SplashViewController.swift
//  SeekAsiaAssesment
//
//  Created by Syed Uzair - Work on 10/25/24.
//

import Foundation
import UIKit

class SplashViewController: UIViewController {
    
    
    private var isUserLoggedIn: Bool {
        if let tokenData = KeychainManager.shared.retrieve(service: KeychainConstants.keychainService, account: KeychainConstants.keychainAccount),
           let token = String(data: tokenData, encoding: .utf8), !token.isEmpty {
            return true
        }
        return false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigateToScreen()
        
    }
    func navigateToScreen() {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let identifier = isUserLoggedIn ? "MainScreenTabBarViewController" : "LoginViewController"
        let vc = sb.instantiateViewController(withIdentifier: identifier)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
