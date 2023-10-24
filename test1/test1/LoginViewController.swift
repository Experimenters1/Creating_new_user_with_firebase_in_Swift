//
//  LoginViewController.swift
//  test1
//
//  Created by Huy Vu on 9/18/23.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {


    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    var email : String = ""
    var password : String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Đăng ký một Gesture Recognizer để bắt sự kiện khi người dùng chạm vào màn hình
                let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
                view.addGestureRecognizer(tapGesture)

    }
    
    // Hàm để ẩn bàn phím khi người dùng chạm vào màn hình
        @objc func hideKeyboard() {
            view.endEditing(true)
        }
    
    
    @IBAction func loginAction(_ sender: Any) {
        guard let email = emailTextField.text, !email.isEmpty,
                     let password = passwordTextField.text, !password.isEmpty else {
                   showAlert(title: "Error", message: "Please enter an email and password.")
                   return
               }
        
        // Lưu email và password vào UserDefaults
            UserDefaults.standard.set(email, forKey: "checkLoginEmail")
            UserDefaults.standard.set(password, forKey: "checkLoginPassword")


        Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
            if error == nil {
                print("You have successfully logged in")
                let allFilesViewController = HomeViewController.makeSelf()
                               
                DispatchQueue.main.async {
                    self.navigationController?.pushViewController(allFilesViewController, animated: true)
                }
            } else {
                self.showAlert(title: "Error", message: error?.localizedDescription ?? "Unknown Error")
            }
        }
    }
    
    func showAlert(title: String, message: String) {
           let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
           let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
           alertController.addAction(defaultAction)
           present(alertController, animated: true, completion: nil)
       }
    

    static func makeSelf() -> LoginViewController {
           let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
           let url_filesViewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController

           return url_filesViewController
       }
    
    
    @IBAction func SignUp(_ sender: Any) {
        
        // Hide the navigation bar button
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        
        
        let allFilesViewController = ViewController.makeSelf()
                       
        DispatchQueue.main.async {
            self.navigationController?.pushViewController(allFilesViewController, animated: true)
        }
    }
    
    @IBAction func ResetPassword(_ sender: Any) {
        let allFilesViewController = ResetPasswordViewController.makeSelf()
                       
        DispatchQueue.main.async {
            self.navigationController?.pushViewController(allFilesViewController, animated: true)
        }
        
    }
    
    
    
}
