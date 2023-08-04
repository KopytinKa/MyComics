//
//  ProfilePresenter.swift
//  MyComics
//
//  Created by Кирилл Копытин on 28.06.2023.
//

import Foundation

final class ProfilePresenter {
    
    // MARK: - Properties
    
    weak var view: ProfileViewInput?
    
    // MARK: - Dependencies
    
    private let coordinator: ProfileCoordinatorProtocol
    private var authService: AuthServiceProtocol
    private var databaseService: DatabaseServiceProtocol
    private let userDefaultsService: UserDefaultsServiceProtocol

    // MARK: - Init
    
    init(
        authService: AuthServiceProtocol,
        databaseService: DatabaseServiceProtocol,
        coordinator: ProfileCoordinatorProtocol,
        userDefaultsService: UserDefaultsServiceProtocol
    ) {
        self.authService = authService
        self.databaseService = databaseService
        self.coordinator = coordinator
        self.userDefaultsService = userDefaultsService
        self.databaseService.delegate = self
    }
}

// MARK: - ProfileViewOutput

extension ProfilePresenter: ProfileViewOutput {
    func logoutButtonPressed() {
        authService.logout()
        coordinator.openAuth()
    }
    
    func favoriteCharactersButtonPressed() {
        coordinator.openFavoriteCharactersScreen()
    }
    
    func readComicsButtonPressed() {
        coordinator.openReadComicsScreen()
    }
    
    func viewIsReady() {
        databaseService.getUser(by: userDefaultsService.string(key: UserDefaultsKeys.userID))
    }
}

// MARK: - ProfileViewOutput

extension ProfilePresenter: DatabaseServiceDelegate {
    func showError(with message: String) {
        view?.showAlert(with: message)
    }
    
    func showData(user: FirebaseUser) {
        let userModel = UserModel(from: user)
        view?.showData(userModel)
    }
    
}
