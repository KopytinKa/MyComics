//
//  ComicsScreenCoordinator.swift
//  MyComics
//
//  Created by Andrey Piskunov on 25.07.2023.
//

import UIKit

final class ComicsScreenCoordinator: ComicsCoordinator {
    
    // MARK: - Dependencies
    
    private let navigationController: UINavigationController?
    
    // MARK: - Init
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    // MARK: - ComicCoordinator
    
    func openDetailScreen(comicID: Int) {
        let viewController = DetailComicModuleBuilder.build(comicID: comicID)
        navigationController?.pushViewController(viewController, animated: true)
    }
}
