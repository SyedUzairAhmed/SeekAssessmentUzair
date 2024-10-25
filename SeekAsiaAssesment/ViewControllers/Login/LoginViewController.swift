//
//  LoginViewController.swift
//  SeekAsiaAssesment
//
//  Created by Syed Uzair - Work on 10/25/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var lblSignIn: UILabel! {
        didSet {
            lblSignIn.setFontStyle(.bold, 30)
            lblSignIn.setFontColor(.textPrimary)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
