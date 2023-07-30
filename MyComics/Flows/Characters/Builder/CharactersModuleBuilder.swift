//
//  CharactersModuleBuilder.swift
//  MyComics
//
//  Created by Кирилл Копытин on 28.06.2023.
//

import UIKit

final class CharactersModuleBuilder {
    static func build(_ navigationController: UINavigationController?) -> UIViewController {
        let charactersAPI = APIBuilder.shared.makeCharactersAPI()
        let likesManager = CharacterLikesStorage(userProvider: UserAuthStorage.shared)
        let dataAdapter = CharactersDataAdapter(
            charactersAPI: charactersAPI,
            likesInfoProvider: likesManager
        )
        let coordinator = CharactersScreenCoordinator(navigationController: navigationController)
        let presenter = CharactersPresenter(
            coordinator: coordinator,
            dataAdapter: dataAdapter,
            likesManager: likesManager
        )
        let viewController = CharactersViewController(presenter: presenter)
        presenter.view = viewController
        return viewController
    }
}
