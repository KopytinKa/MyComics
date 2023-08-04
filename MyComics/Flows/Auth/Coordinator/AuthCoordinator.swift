//
//  AuthCoordinator.swift
//  MyComics
//
//  Created by Кирилл Копытин on 23.07.2023.
//

import UIKit

final class AuthCoordinator: AuthCoordinatorProtocol {
    
    // MARK: - Dependencies
    
    private let navigationController: UINavigationController?
    
    // MARK: - Init
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    // MARK: - AuthCoordinatorProtocol
    
    func openProfile() {
        let viewController = ProfileModuleBuilder.build(navigationController)
        navigationController?.setViewControllers([viewController], animated: true)
    }
}
