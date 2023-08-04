//
//  AuthPresenter.swift
//  MyComics
//
//  Created by Кирилл Копытин on 23.07.2023.
//

import Foundation

final class AuthPresenter {
    
    // MARK: - Properties
    
    weak var view: AuthViewInput?
    private var isLogin: Bool = true
    
    // MARK: - Dependencies
    
    private let coordinator: AuthCoordinatorProtocol
    private var authService: AuthServiceProtocol
    private var databaseService: DatabaseServiceProtocol
    private let userDefaultsService: UserDefaultsServiceProtocol
    
    // MARK: - Init
    
    init(
        authService: AuthServiceProtocol,
        databaseService: DatabaseServiceProtocol,
        coordinator: AuthCoordinatorProtocol,
        userDefaultsService: UserDefaultsServiceProtocol
    ) {
        self.authService = authService
        self.databaseService = databaseService
        self.coordinator = coordinator
        self.userDefaultsService = userDefaultsService
        self.authService.delegate = self
        self.authService.checkAuth()
    }
}

// MARK: - AuthViewOutput

extension AuthPresenter: AuthViewOutput {
    func enterButtonPressed(name: String?, email: String?, password: String?) {
        if isLogin {
            guard let email, let password, !email.isEmpty, !password.isEmpty
            else {
                view?.showAlert(with: "")
                return
                
            }
            
            authService.login(email: email, password: password)
        } else {
            guard let name, let email, let password, !name.isEmpty, !email.isEmpty, !password.isEmpty
            else {
                view?.showAlert(with: "")
                return
            }
            
            authService.register(name: name, email: email, password: password)
        }
    }
    
    func switchLoginButtonPressed() {
        isLogin.toggle()
        view?.configure(isLogin: isLogin)
    }
    
    func viewIsReady() {
        view?.configure(isLogin: isLogin)
    }
}

// MARK: - AuthServiceDelegate

extension AuthPresenter: AuthServiceDelegate {
    func saveUser(_ user: FirebaseUser) {
        databaseService.saveUser(user)
    }
    
    func logoutSuccess() {
        userDefaultsService.remove(key: UserDefaultsKeys.userID)
    }
    
    func loginSuccess(by uid: String) {
        userDefaultsService.set(key: UserDefaultsKeys.userID, value: uid)
        coordinator.openProfile()
    }
    
    func showError(with message: String) {
        view?.showAlert(with: message)
    }
}
