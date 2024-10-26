//
//  BaseClass.swift
//  SeekAsiaAssesment
//
//  Created by Syed Uzair - Work on 10/26/24.
//

import Foundation
import UIKit
import Toaster


class BaseClass: UIViewController {
    
    var rootVC:UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let delegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        self.rootVC = delegate.window?.rootViewController
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Email Validition
    
    func isValidEmail(testStr:String) -> Bool {
        
        print("validate emilId: \(testStr)")
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        var emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        var result = emailTest.evaluate(with: testStr)
        
        return result
        
    }
    
    // MARK: - Show Toast
    
    public func showToast(title:String){
        Toast(text:title, duration: Delay.long).show()
    }

    
}
