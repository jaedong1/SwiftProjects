//
//  CustomPopUpViewController.swift
//  CustomPopUp_tutorial
//
//  Created by 김재동 on 2022/08/13.
//

import UIKit

class CustomPopUpViewController: UIViewController {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var subscribeButon: UIButton!
    @IBOutlet weak var backgroundButton: UIButton!
    @IBOutlet weak var naverButton: UIButton!
    @IBOutlet weak var youTubeButton: UIButton!
    
    var subscribeButtonCompletionClosure: (() -> Void)?
    var myPopUpDelegate: PopUpDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("CustomPopUpViewController - viewDidLoad called!")
        contentView.layer.cornerRadius = 10
        subscribeButon.layer.cornerRadius = 10
        naverButton.layer.cornerRadius = 10
        youTubeButton.layer.cornerRadius = 10
    }
    
    @IBAction func TouchUpBackGroundButton(_ sender: UIButton) {
        print("CustomPopUpViewController - TouchUpBackGroundButton Called!")
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func TouchUpSubscribeButton(_ sender: UIButton) {
        print("CustomPopUpViewController - TouchUpSubscribeButton Called!")
        
        self.dismiss(animated: true, completion: nil)
        
        if let subscribeButtonCompletionClosure = subscribeButtonCompletionClosure {
            subscribeButtonCompletionClosure()
        }
    }
    
    @IBAction func TouchUpNaverButton(_ sender: UIButton) {
        print("CustomPopUpViewController - TouchUpNaverButton Called!")
        self.dismiss(animated: true, completion: nil)
        myPopUpDelegate?.TouchUpNaverButton()
    }
    
    @IBAction func TouchUpYoutubeButton(_ sender: UIButton) {
        print("CustomPopUpViewController - TouchUpYoutubeButton Called!")
        self.dismiss(animated: true, completion: nil)
        NotificationCenter.default.post(name: Notification.Name(notificationName), object: nil)
    }
}
