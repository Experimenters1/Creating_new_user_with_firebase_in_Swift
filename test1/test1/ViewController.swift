//
//  ViewController.swift
//  test1
//
//  Created by Huy Vu on 9/18/23.
//

import UIKit
import Firebase
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var First_Name: UITextField!
    
    @IBOutlet weak var Last_Name: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Đăng ký một Gesture Recognizer để bắt sự kiện khi người dùng chạm vào màn hình
                let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
                view.addGestureRecognizer(tapGesture)
       
    }
    
    // Hàm để ẩn bàn phím khi người dùng chạm vào màn hình
      @objc func hideKeyboard() {
          view.endEditing(true)
      }

    @IBAction func createAccountAction(_ sender: Any) {
        guard let email = emailTextField.text, let password = passwordTextField.text else {
                    showAlert(title: "Error", message: "Please enter your email and password")
                    return
                }
                
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            if let error = error {
                self.showAlert(title: "Error", message: error.localizedDescription)
            } else {
                print("You have successfully signed up")
                
                // Assuming you have a Firebase Realtime Database, you can push user data like this:
                if let user = authResult?.user {
                    let userData = ["email": user.email ?? ""]
                    let ref = Database.database().reference().child("users").child(user.uid)
                    ref.setValue(userData)
                }
                
                // Lưu dữ liệu từ hai UITextField vào UserDefaults
                UserDefaults.standard.set(self.First_Name.text, forKey: "First_Name")
                UserDefaults.standard.set(self.Last_Name.text, forKey: "Last_Name")
                       
                       // Lưu trạng thái mới của UserDefaults
                       UserDefaults.standard.synchronize()
                
                // Hide the navigation bar
                self.navigationController?.isNavigationBarHidden = true

                
                // Go to the setup page or another view as needed
                let allFilesViewController = LoginViewController.makeSelf()
                               
                DispatchQueue.main.async {
                    self.navigationController?.pushViewController(allFilesViewController, animated: true)
                }
            }
        }
    }
    
    func showAlert(title: String, message: String) {
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
        }
    
    
    @IBAction func Login(_ sender: Any) {
        let allFilesViewController = LoginViewController.makeSelf()
                       
        DispatchQueue.main.async {
            self.navigationController?.pushViewController(allFilesViewController, animated: true)
        }
    }
    
    
   
    
    
    
    
    
    static func makeSelf() -> ViewController {
           let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
           let url_filesViewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController

           return url_filesViewController
       }
    
    
}

