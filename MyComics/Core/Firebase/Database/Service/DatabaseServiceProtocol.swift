//
//  DatabaseServiceProtocol.swift
//  MyComics
//
//  Created by Кирилл Копытин on 23.07.2023.
//

import Foundation

protocol DatabaseServiceProtocol {
    var delegate: DatabaseServiceDelegate? { get set }
    func saveUser(_ user: FirebaseUser)
    func getUser(by uid: String)
}
