//
//  checkLogin.swift
//  test1
//
//  Created by Huy Vu on 10/23/23.
//

import UIKit
import FirebaseAuth

class checkLogin: UIViewController {
    
    var email : String = ""
    var password : String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Thực hiện các tác vụ trước khi view controller xuất hiện.
        // Lấy giá trị từ UserDefaults và gán cho biến email và password
                if let storedEmail = UserDefaults.standard.string(forKey: "checkLoginEmail"),
                   let storedPassword = UserDefaults.standard.string(forKey: "checkLoginPassword") {
                    email = storedEmail
                    password = storedPassword
                }

                checkLoginStatus(email: email, password: password)
    }

    

    func checkLoginStatus(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if let error = error {
                // Đăng nhập thất bại, in ra "No login"
                print("No login")
            } else if user != nil {
                // Đăng nhập thành công, in ra "OK"
                print("OK")
                let allFilesViewController = HomeViewController.makeSelf()
                               
                DispatchQueue.main.async {
                    self.navigationController?.pushViewController(allFilesViewController, animated: true)
                }
            }
        }
    }
    
    
    @IBAction func Login(_ sender: Any) {
        let allFilesViewController = LoginViewController.makeSelf()
                       
        DispatchQueue.main.async {
            self.navigationController?.pushViewController(allFilesViewController, animated: true)
        }
    }
    
    
    
    @IBAction func SignUp(_ sender: Any) {
        let allFilesViewController = ViewController.makeSelf()
                       
        DispatchQueue.main.async {
            self.navigationController?.pushViewController(allFilesViewController, animated: true)
        }
    }
    
    
    static func makeSelf() -> checkLogin {
           let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
           let url_filesViewController = storyboard.instantiateViewController(withIdentifier: "checkLogin") as! checkLogin

           return url_filesViewController
       }
    
}
