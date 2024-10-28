//
//  LoginViewController.swift
//  SeekAsiaAssesment
//
//  Created by Syed Uzair - Work on 10/25/24.
//

import UIKit

class LoginViewController: BaseClass {
    
    // MARK: - Outlets
    
    @IBOutlet weak var lblSignIn: UILabel! {
        didSet {
            lblSignIn.setFontStyle(.bold, 30)
            lblSignIn.setFontColor(.textPrimary)
        }
    }
    @IBOutlet weak var lblEmailAddress: UILabel! {
        didSet {
            lblEmailAddress.setFontStyle(.light, 17)
            lblEmailAddress.setFontColor(.textPrimary)
        }
    }
    @IBOutlet weak var emailAddressTextField : LoginTextField!
    @IBOutlet weak var lblPassword: UILabel! {
        didSet {
            lblPassword.setFontStyle(.light, 17)
            lblPassword.setFontColor(.textPrimary)
        }
    }
    @IBOutlet weak var passwordTextField : LoginTextField!
    @IBOutlet weak var btnLogin: BaseButton!
    
    // MARK: - Properties
    
    lazy var loginViewModel = LoginViewModel()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Action Methods
    
    @IBAction func btnLoginPressed(_ sender: UIButton) {
        self.loginAction()
    }
    
    @IBAction func btnRegisterPressed(_ sender: UIButton) {
        self.showToast(title: GlobalValidation.comingSoonMessage)
    }
    
    // MARK: - Login Method
    
    func loginAction() {
        
        if let email = self.emailAddressTextField.textFieldText,
           let password = self.passwordTextField.textFieldText,
           loginViewModel.validateInput(username: email, password: password, viewController: self) {
            
            login(emailAddress: email, password: password)
        }
    }
    
    private func login(emailAddress: String, password: String) {
        loginViewModel.login(emailAddress: emailAddress, password: password) { [weak self] in
            DispatchQueue.main.async {
                if let errorMessage = self?.loginViewModel.errorMessage {
                    self?.showToast(title: errorMessage)
                } else {
                    self?.navigateToMainScreen()
                }
            }
        }
    }
    
    // MARK: - Util Method
    
    func navigateToMainScreen() {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "MainScreenTabBarViewController")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
