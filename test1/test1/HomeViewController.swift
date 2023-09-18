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

        // Do any additional setup after loading the view.
    }
    
    @IBAction func logOutAction(_ sender: Any) {
        if Auth.auth().currentUser != nil {
            do {
                try Auth.auth().signOut()
                let loginViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
                navigationController?.pushViewController(loginViewController, animated: true)
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
    }

    
    static func makeSelf() -> HomeViewController {
           let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
           let url_filesViewController = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController

           return url_filesViewController
       }

}
