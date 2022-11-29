//
//  RegisterViewControl.swift
//  NavigationViewController_tutorial
//
//  Created by 김재동 on 2022/08/13.
//

import UIKit

class RegisterViewController: UIViewController {
    @IBOutlet var btnForLoginViewController: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.navigationController?.isNavigationBarHidden = true
    }

    @IBAction func onLoginViewControllerBtnClicked(_ sender: UIButton) {
        print("RegisterViewController - onLoginViewControllerBtnClicked() called")
        self.navigationController?.popViewController(animated: true)
    }

}
