//
//  MyProfileViewController.swift
//  SeekAsiaAssesment
//
//  Created by Syed Uzair - Work on 10/28/24.
//

import UIKit

class MyProfileViewController: BaseClass {
    
    @IBOutlet weak var viewNavBar: UIView! {
        didSet {
            viewNavBar.backgroundColor = UIColor(hexString: Color.button.rawValue)
        }
    }
    @IBOutlet weak var lblFullNameTitle: UILabel! {
        didSet {
            lblFullNameTitle.setFontStyle(.bold, 17)
            lblFullNameTitle.setFontColor(.textPrimary)
        }
    }
    @IBOutlet weak var lblCurrentCompanyTitle: UILabel! {
        didSet {
            lblCurrentCompanyTitle.setFontStyle(.bold, 17)
            lblCurrentCompanyTitle.setFontColor(.textPrimary)
        }
    }
    @IBOutlet weak var lblTotalExperienceTitle: UILabel! {
        didSet {
            lblTotalExperienceTitle.setFontStyle(.bold, 17)
            lblTotalExperienceTitle.setFontColor(.textPrimary)
        }
    }
    @IBOutlet weak var lblResumeTitle: UILabel! {
        didSet {
            lblResumeTitle.setFontStyle(.bold, 17)
            lblResumeTitle.setFontColor(.textPrimary)
        }
    }
    
    @IBOutlet weak var lblFullName: UILabel! {
        didSet {
            lblFullName.setFontStyle(.light, 14)
            lblFullName.setFontColor(.textPrimary)
        }
    }
    @IBOutlet weak var lblCurrentCompany: UILabel! {
        didSet {
            lblCurrentCompany.setFontStyle(.light, 14)
            lblCurrentCompany.setFontColor(.textPrimary)
        }
    }
    @IBOutlet weak var lblTotalExperience: UILabel! {
        didSet {
            lblTotalExperience.setFontStyle(.light, 14)
            lblTotalExperience.setFontColor(.textPrimary)
        }
    }
    @IBOutlet weak var lblResume: UILabel! {
        didSet {
            lblResume.setFontStyle(.light, 14)
            lblResume.setFontColor(.textPrimary)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        
    }
    
    // MARK: - Util Methods
    
    func setupUI() {
        self.lblFullName.text = "User1"
        self.lblCurrentCompany.text = "Apple Inc"
        self.lblTotalExperience.text = "10 Years"
        self.lblResume.text = "iOS Mobile App Engineer.pdf"
    }
    
    func logout() {
        KeychainManager.shared.remove(service: KeychainConstants.keychainService, account: KeychainConstants.keychainAccount)
        if let loginVC = self.navigationController?.viewControllers.first(where: { $0 is LoginViewController }) {
            self.navigationController?.popToViewController(loginVC, animated: true)
        } else {
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let newLoginVC = sb.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            self.navigationController?.setViewControllers([newLoginVC], animated: true)
            
            self.showToast(title: NetworkingConstants.logoutMessage)
        }
    }
    
    // MARK: - Action Methods
    
    @IBAction func btnLogoutPressed(_ sender: UIButton) {
        self.logout()
    }
    
}
