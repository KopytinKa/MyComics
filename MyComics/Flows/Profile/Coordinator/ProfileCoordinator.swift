//
//  ProfileCoordinator.swift
//  MyComics
//
//  Created by Кирилл Копытин on 23.07.2023.
//

import UIKit

final class ProfileCoordinator: ProfileCoordinatorProtocol {
    
    // MARK: - Dependencies
    
    private let navigationController: UINavigationController?
    
    // MARK: - Init
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    // MARK: - ProfileCoordinatorProtocol
    
    func openAuth() {
        let viewController = AuthModuleBuilder.build(navigationController)
        navigationController?.setViewControllers([viewController], animated: true)
    }
    
    func openReadComicsScreen() {
        // TODO: 4.9 openReadComicsScreen
    }
    
    func openFavoriteCharactersScreen() {
        // TODO: 4.9 openFavoriteCharactersScreen
    }
}
