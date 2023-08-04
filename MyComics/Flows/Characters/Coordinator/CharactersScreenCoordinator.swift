//
//  CharactersScreenCoordinator.swift
//  MyComics
//
//  Created by Антон Сивцов on 09.07.2023.
//

import UIKit

final class CharactersScreenCoordinator: CharactersCoordinator {
    
    // MARK: - Dependencies
    
    private let navigationController: UINavigationController?
    
    // MARK: - Init
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    // MARK: - CharactersCoordinator
    
    func openDetailScreen(characterID: Int) {
        let viewController = DetailCharacterModuleBuilder.build(characterID: characterID)
        navigationController?.pushViewController(viewController, animated: true)
    }
}
