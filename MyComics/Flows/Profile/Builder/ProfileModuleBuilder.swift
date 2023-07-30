//
//  ProfileModuleBuilder.swift
//  MyComics
//
//  Created by Кирилл Копытин on 28.06.2023.
//

import UIKit

final class ProfileModuleBuilder {
    
    static func build(_ navigationController: UINavigationController?) -> UIViewController {
        let authService = AuthService(userStorage: UserAuthStorage.shared)
        let databaseService = DatabaseService()
        let coordinator = ProfileCoordinator(navigationController: navigationController)
        let userDefaultsService = UserDefaultsService()

        let presenter = ProfilePresenter(
            authService: authService,
            databaseService: databaseService,
            coordinator: coordinator,
            userDefaultsService: userDefaultsService
        )
        let vc = ProfileViewController(presenter: presenter)
        presenter.view = vc
        
        return vc
    }
}
