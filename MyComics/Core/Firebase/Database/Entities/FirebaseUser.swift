//
//  FirebaseUser.swift
//  MyComics
//
//  Created by Кирилл Копытин on 23.07.2023.
//

import Foundation
import FirebaseDatabase

struct FirebaseUser {
    let id: String
    let name: String
    let email: String
    let ref: DatabaseReference?
    
    init(id: String, name: String, email: String) {
        self.ref = nil
        self.id = id
        self.name = name
        self.email = email
    }
    
    init?(snapshot: DataSnapshot) {
        guard
            let value = snapshot.value as? [String: Any],
            let name = value[FirebaseKeys.UserKeys.name] as? String,
            let email = value[FirebaseKeys.UserKeys.email] as? String
        else {
            return nil
        }
        
        self.ref = snapshot.ref
        self.id = snapshot.key
        self.name = name
        self.email = email
    }
    
    func toAnyObject() -> [String: Any] {
        return [
            FirebaseKeys.UserKeys.name: name,
            FirebaseKeys.UserKeys.email: email
        ]
    }
}
