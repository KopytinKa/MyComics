//
//  AuthServiceDelegate.swift
//  MyComics
//
//  Created by Кирилл Копытин on 23.07.2023.
//

import Foundation

protocol AuthServiceDelegate: AnyObject {
    func showError(with message: String)
    func saveUser(_ user: FirebaseUser)
    func loginSuccess(by uid: String)
    func logoutSuccess()
}
