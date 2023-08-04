//
//  UserModel.swift
//  MyComics
//
//  Created by Кирилл Копытин on 23.07.2023.
//

import Foundation

struct UserModel: Hashable {
    let id: String
    let name: String
    let email: String
    
    init(id: String, name: String, email: String) {
        self.id = id
        self.name = name
        self.email = email
    }
    
    init(from model: FirebaseUser) {
        id = model.id
        name = model.name
        email = model.email
    }
}
