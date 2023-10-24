//
//  ChatUser.swift
//  test1
//
//  Created by Huy Vu on 10/23/23.
//

import Foundation

class ChatUser {
    var id: String { uid }
    
    let uid, email, profileImageUrl: String

    
    init(data: [String: Any]) {
        self.uid = data["uid"] as? String ?? ""
        self.email = data["email"] as? String ?? ""
        self.profileImageUrl = data["profileImageUrl"] as? String ?? ""
    }
    
    static let shared = ChatUser(data: [:]) // Initialize with default values or customize as needed
}


//let currentUser = ChatUser.shared
//let userID = currentUser.id
//let userEmail = currentUser.email
//let profileImageURL = currentUser.profileImageUrl
//
//// Sử dụng userID, userEmail và profileImageURL theo nhu cầu
