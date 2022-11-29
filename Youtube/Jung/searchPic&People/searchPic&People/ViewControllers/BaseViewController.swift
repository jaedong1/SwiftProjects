//
//  BaseViewController.swift
//  searchPic&People
//
//  Created by 김재동 on 2022/08/15.
//

import UIKit

class BaseViewController: UIViewController {
    var viewControllerTitle: String = "" {
        didSet {
            print("UserListViewController - viewControllerTitle didSet Called! / vcTitle : \(viewControllerTitle)")
            title = viewControllerTitle
        }
    }
}
