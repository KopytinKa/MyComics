//
//  AuthModuleBuilder.swift
//  MyComics
//
//  Created by Кирилл Копытин on 23.07.2023.
//

import UIKit

final class AuthModuleBuilder {
    static func build(_ navigationController: UINavigationController?) -> UIViewController {
        let authService = AuthService(userStorage: UserAuthStorage.shared)
        let databaseService = DatabaseService()
        let coordinator = AuthCoordinator(navigationController: navigationController)
        let userDefaultsService = UserDefaultsService()
        
        let presenter = AuthPresenter(
            authService: authService,
            databaseService: databaseService,
            coordinator: coordinator,
            userDefaultsService: userDefaultsService
        )
        let vc = AuthViewController(presenter: presenter)
        presenter.view = vc
        
        return vc
    }
}
