//
//  HomeViewController.swift
//  searchPic&People
//
//  Created by κΉμ¬λ on 2022/08/14.
//

import UIKit
import Toast_Swift

class HomeViewController: UIViewController, UISearchBarDelegate, UIGestureRecognizerDelegate {

    @IBOutlet weak var searchFilterSegment: UISegmentedControl!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searchIndicator: UIActivityIndicatorView!
    @IBOutlet weak var searchButton: UIButton!
    
    var keyboardDismissTabGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: HomeViewController.self, action: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print("HomeViewController - viewDidLoad Called!")
        config()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        searchBar.becomeFirstResponder()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("HomeViewController - prepare Called! / segue.identifier : \(segue.identifier)")
        
        switch segue.identifier {
        case SEGUE_ID.USER_LIST_VIEWCONTROLLER:
            let nextViewController = segue.destination as! UserListViewController
            
            guard let userInputValue = self.searchBar.text else { return }
            
            nextViewController.viewControllerTitle = userInputValue + "π₯°"
            
        case SEGUE_ID.PHOTO_COLLECTION_VIEWCONTROLLER:
            let nextViewController = segue.destination as! UserListViewController
            
            guard let userInputValue = self.searchBar.text else { return }
            
            nextViewController.viewControllerTitle = userInputValue + "π"
            
        default:
            print("default")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        print("HomeViewController - viewWillAppear Called!")
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShowHandler(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHideHandler(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        print("HomeViewController - viewWillDisappear Called!")
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    //MARK: - fileprivate methods
    fileprivate func config() {
        searchButton.layer.cornerRadius = 10
        searchBar.searchBarStyle = .minimal
        searchBar.delegate = self
        keyboardDismissTabGesture.delegate = self
        view.addGestureRecognizer(keyboardDismissTabGesture)
    }
    
    fileprivate func pushViewController() {
        var segueId: String = ""
        
        switch searchFilterSegment.selectedSegmentIndex {
        case 0:
            segueId = "goToUserListViewController"
        case 1:
            segueId = "goToPhotoCollectionViewController"
        default:
            segueId = "goToUserListViewController"
        }
        
        self.performSegue(withIdentifier: segueId, sender: self)
    }
    
    @objc func keyboardWillShowHandler(notification: NSNotification) {
        print("HomeViewController - keyboardWillShow Called! ")
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if keyboardSize.height < searchButton.frame.origin.y {
                let distance = keyboardSize.height - searchButton.frame.origin.y
                self.view.frame.origin.y = distance
            }
        }
    }
    
    @objc func keyboardWillHideHandler(notification: Notification) {
        print("HomeViewController - keyboardWillHide Called!")
        self.view.frame.origin.y = 0
    }

    //MARK: - IBAction methods
    @IBAction func searchFilterValueChanged(_ sender: UISegmentedControl) {
        print("HomeViewController - searchFilterValueChanged Called! / \(sender.selectedSegmentIndex)")
        
        var searchBarTitle = "μ¬μ§ ν€μλ"
        
        switch sender.selectedSegmentIndex {
        case 0:
            searchBarTitle = "μ¬μ§ ν€μλ"
        case 1:
            searchBarTitle = "μ¬μ©μ μ΄λ¦"
        default:
            searchBarTitle = "μ¬μ§ ν€μλ"
        }
        
        searchBar.placeholder = searchBarTitle + "μλ ₯"
        searchBar.becomeFirstResponder()
    }
    
    @IBAction func TouchUpSearchButton(_ sender: UIButton) {
        print("HomeViewController - TouchUpSearchButton Called! / \(searchFilterSegment.selectedSegmentIndex)")
        
        pushViewController()
    }
    
    //MARK: - UISearchBar Delegate methods
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("HomeViewController - searchBarCancelButtonClicked Called!")
        
        guard let userInputString = searchBar.text else { return }
        
        if userInputString.isEmpty {
            self.view.makeToast("π’ κ²μ ν€μλλ₯Ό μλ ₯ν΄μ£ΌμΈμ.", duration: 3.0, position: .center)
        } else {
            pushViewController()
            searchBar.resignFirstResponder()
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("HomeViewController - searchBar textDidChange Called! searchText : \(searchText)")
        
        if searchText.isEmpty {
            searchButton.isHidden = true
            //searchBar.resignFirstResponder()
        } else {
            searchButton.isHidden = false
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let inputTextCount = searchBar.text?.appending(text).count ?? 0
        print("shouldChangeTextIn : \(inputTextCount)")
        
        if inputTextCount > 12 {
            self.view.makeToast("π’ 12μκΉμ§λ§ μλ ₯ κ°λ₯ν©λλ€.", duration: 3.0, position: .center)
            return false
        } else {
            return true
        }
    }
    
    //MARK: - UIGestureRecognizerDelegate
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        print("HomeViewController - gestureRecognizer shouldRecieve Called!")
        
        if touch.view?.isDescendant(of: searchFilterSegment) == true {
            return false
        } else if touch.view?.isDescendant(of: searchBar) == true {
            return false
        } else {
            view.endEditing(true)
            return true
        }
    }
}
