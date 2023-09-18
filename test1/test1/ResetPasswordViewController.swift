//
//  ResetPasswordViewController.swift
//  test1
//
//  Created by Huy Vu on 9/18/23.
//

import UIKit
import Firebase
import FirebaseAuth

class ResetPasswordViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func submitAction(_ sender: Any) {
        if let email = emailTextField.text, !email.isEmpty {
                    Auth.auth().sendPasswordReset(withEmail: email) { (error) in
                        var title = ""
                        var message = ""
                        
                        if let error = error {
                            title = "Error!"
                            message = error.localizedDescription
                        } else {
                            title = "Success!"
                            message = "Password reset email sent."
                            self.emailTextField.text = ""
                        }
                        
                        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
                        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                        alertController.addAction(defaultAction)
                        self.present(alertController, animated: true, completion: nil)
                    }
        } else {
            let alertController = UIAlertController(title: "Oops!", message: "Please enter an email.", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
        }
    }
    
    static func makeSelf() -> ResetPasswordViewController {
           let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
           let url_filesViewController = storyboard.instantiateViewController(withIdentifier: "ResetPasswordViewController") as! ResetPasswordViewController

           return url_filesViewController
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
    
}
