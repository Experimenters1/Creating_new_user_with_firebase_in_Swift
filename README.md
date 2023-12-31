# Creating_new_user_with_firebase_in_Swift
## [Creating_new_user_with_firebase_in_Swift](https://stackoverflow.com/questions/36579138/creating-new-user-with-firebase-in-swift) <br><br>
### [Add Firebase to your Apple project](https://firebase.google.com/docs/ios/setup) <br><br>
### [Get Started with Firebase Authentication on Apple Platforms](https://firebase.google.com/docs/auth/ios/start) <br><br>



[IOS Introducing Firebase with Swift 3: Login and Sign Up](https://www.appcoda.com/firebase-login-signup/) <br><br>

![Screenshot 2023-10-12 at 2 12 41 PM](https://github.com/Experimenters1/Creating_new_user_with_firebase_in_Swift/assets/64000769/f79650a2-6f1d-4ed4-8c44-0cb804852e88)


## [How to hide a navigation bar from first ViewController in Swift?](https://stackoverflow.com/questions/29209453/how-to-hide-a-navigation-bar-from-first-viewcontroller-in-swift) <br><br>

```swift
// Hide the navigation bar
self.navigationController?.isNavigationBarHidden = true


```

```swift
// Show the navigation bar
self.navigationController?.isNavigationBarHidden = false

```




![Screenshot 2023-09-18 at 4 36 45 PM](https://github.com/Experimenters1/Creating_new_user_with_firebase_in_Swift/assets/64000769/a7d2556f-c4b7-4b7e-b02a-323e3a563724)

![Screenshot 2023-10-24 at 11 48 33 AM](https://github.com/Experimenters1/Creating_new_user_with_firebase_in_Swift/assets/64000769/10e757ba-6cf6-4474-87f0-362b168df315)

![Screenshot 2023-09-18 at 4 16 41 PM](https://github.com/Experimenters1/Creating_new_user_with_firebase_in_Swift/assets/64000769/189a967a-90f8-4f1c-af71-d6945132c1b8)
![Screenshot 2023-09-18 at 4 16 51 PM](https://github.com/Experimenters1/Creating_new_user_with_firebase_in_Swift/assets/64000769/3aa893e5-b154-47de-a3ba-8c64205132bb)
![Screenshot 2023-09-18 at 4 17 06 PM](https://github.com/Experimenters1/Creating_new_user_with_firebase_in_Swift/assets/64000769/ca59bdac-c258-4f95-b5b7-c95fd7318c65)

```swift
import UIKit

class ViewController: UIViewController {

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
}


```
