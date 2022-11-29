//
//  ViewController.swift
//  CustomPopUp_tutorial
//
//  Created by 김재동 on 2022/08/13.
//

import UIKit
import WebKit

let notificationName = "buttonClickNotification"

class ViewController: UIViewController, PopUpDelegate {
    
    @IBOutlet weak var CreatePopUpButton: UIButton!
    @IBOutlet weak var myWebView: WKWebView!
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        CreatePopUpButton.layer.cornerRadius = 10
        NotificationCenter.default.addObserver(self, selector: #selector(LoadWebView),
                                               name: NSNotification.Name(notificationName), object: nil)
    }
    
    @objc fileprivate func LoadWebView() {
        print("ViewController - LoadWebView Called!")
        let youtubeURL = URL(string: "https://www.youtube.com")
        myWebView.load(URLRequest(url: youtubeURL!))
    }

    @IBAction func TouchUpCreatePopUpButton(_ sender: UIButton) {
        print("ViewController - TouchUpCreatePopUpButton Called!")
        
        let stortyBoard = UIStoryboard.init(name: "PopUp", bundle: nil)
        let CustomPopUpViewController = stortyBoard.instantiateViewController(withIdentifier: "CustomPopUpViewController") as! CustomPopUpViewController
        CustomPopUpViewController.modalPresentationStyle = .overCurrentContext
        CustomPopUpViewController.modalTransitionStyle = .crossDissolve
        
        CustomPopUpViewController.subscribeButtonCompletionClosure = {
            print("컴플레션 블럭이 호출되었다.")
            let myChannelURL = URL(string: "https://www.instagram.com/jea__dong/")
            self.myWebView.load(URLRequest(url: myChannelURL!))
        }
        
        CustomPopUpViewController.myPopUpDelegate = self
        
        self.present(CustomPopUpViewController, animated: true, completion: nil)
    }
    
    func TouchUpNaverButton() {
        print("ViewController - TouchUpNaverButton Called!")
        let naverURL = URL(string: "https://www.naver.com")
        myWebView.load(URLRequest(url: naverURL!))
    }

}

