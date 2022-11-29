//
//  SeguePresentViewController.swift
//  ScreenTransitionExample
//
//  Created by 김재동 on 2022/08/16.
//

import UIKit

class SeguePresentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - IBAction functions
    @IBAction func tapBackButton(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
