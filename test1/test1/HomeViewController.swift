//
//  HomeViewController.swift
//  test1
//
//  Created by Huy Vu on 9/18/23.
//

import UIKit
import Firebase
import FirebaseAuth

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

//        // Do any additional setup after loading the view.
//        // Disable the swipe back gesture
//           if let navigationController = self.navigationController {
//               navigationController.interactivePopGestureRecognizer?.isEnabled = false;
//           }
//        // Ẩn nút trở lại trên thanh điều hướng
//            self.navigationItem.hidesBackButton = true
        
        // Hide the navigation bar
        self.navigationController?.isNavigationBarHidden = true

    }
    
    @IBAction func logOutAction(_ sender: Any) {
        if Auth.auth().currentUser != nil {
            do {
                try Auth.auth().signOut()
                let loginViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "checkLogin") as! checkLogin
                navigationController?.pushViewController(loginViewController, animated: true)
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
        
        // Xoá email và password từ UserDefaults
        UserDefaults.standard.removeObject(forKey: "checkLoginEmail")
        UserDefaults.standard.removeObject(forKey: "checkLoginPassword")

        // Lưu các thay đổi vào UserDefaults
        UserDefaults.standard.synchronize()

    }

    
    static func makeSelf() -> HomeViewController {
           let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
           let url_filesViewController = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController

           return url_filesViewController
       }

}
