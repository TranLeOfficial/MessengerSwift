//
//  DatabaseManager.swift
//  Messenger
//
//  Created by Trần Lễ on 9/29/21.
//

import Foundation
import FirebaseDatabase


final class DatabaseManager {
    static let shared = DatabaseManager()
    private let database = Database.database().reference()
}

//MARK: - Account Management
extension DatabaseManager {
    
    public func userExists(with email: String,
                           completion: @escaping ((Bool) -> Void)) {
        
        database.child(email).observeSingleEvent(of: .value) { snapshot in
            guard snapshot.value as? String != nil else {
                completion(false)
                return
            }
            completion(true)
        }
    }
    
    //Add new user to Database
    public func insertUser(with user: ChatAppUser) {
        database.child(user.emailAddress).setValue([
            "first_name": user.firstName,
            "last_name": user.lastName,
            "password": user.password
        ])
    }
}


struct ChatAppUser {
    let emailAddress: String
    let firstName: String
    let lastName: String
    let password: String
    //let profilePictureUrl: String
}
