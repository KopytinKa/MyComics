//
//  AuthService.swift
//  MyComics
//
//  Created by Кирилл Копытин on 23.07.2023.
//

import Foundation
import Firebase

final class AuthService: AuthServiceProtocol {
    
    // MARK: - Properties

    weak var delegate: AuthServiceDelegate?
    
    // MARK: - Private Properties
    
    private let userStorage: UserIDStoragable
    
    // MARK: - Init
    
    init(userStorage: UserIDStoragable) {
        self.userStorage = userStorage
    }
    
    // MARK: - Methods

    func login(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] _, error in
            if let error {
                self?.delegate?.showError(with: error.localizedDescription)
                return
            }
        }
    }
    
    func register(name: String, email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] authResult, error in
            if let error {
                self?.delegate?.showError(with: error.localizedDescription)
                return
            }
            
            if let authResult {
                let userModel = FirebaseUser(
                    id: authResult.user.uid,
                    name: name,
                    email: email
                )
                self?.delegate?.saveUser(userModel)
            }
        }
    }
    
    func logout() {
        do {
            try Auth.auth().signOut()
        } catch {
            delegate?.showError(with: error.localizedDescription)
        }
    }
    
    func checkAuth() {
        Auth.auth().addStateDidChangeListener { [weak self] _, user in
            if let user {
                self?.userStorage.saveUser(user.uid)
                self?.delegate?.loginSuccess(by: user.uid)
            } else {
                self?.delegate?.logoutSuccess()
            }
        }
    }
}
