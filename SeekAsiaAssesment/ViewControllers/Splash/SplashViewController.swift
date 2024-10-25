//
//  SplashViewController.swift
//  SeekAsiaAssesment
//
//  Created by Syed Uzair - Work on 10/25/24.
//

import Foundation
import UIKit

enum NavigationType {
    case loginScreen
    case dashboardScreen
}

class SplashViewController: UIViewController {
    
    
//    private var isUserLoggedIn: Bool {
//        return KeychainHelper.shared.read(
//            services: AppConstants.
//        )
//    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navigateToLanding()
        
    }
    

    
    func navigateToLanding() {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "LoginViewController")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
