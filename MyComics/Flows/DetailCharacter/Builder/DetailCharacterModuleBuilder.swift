//
//  ChsracterDetailModuleBuilder.swift
//  MyComics
//
//  Created by Andrey Piskunov on 10.07.2023.
//

import UIKit

final class DetailCharacterModuleBuilder {
    
    static func build(characterID: Int) -> UIViewController {
        let apiService = APIBuilder.shared.makeCharactersAPI()
        let likesManager = CharacterLikesStorage(userProvider: UserAuthStorage.shared)
        let presenter = DetailCharacterPresenter(
            id: characterID,
            characterAPIService: apiService,
            likesManager: likesManager
        )
        let vc = DetailCharacterViewController(presenter: presenter)
        presenter.view = vc
        return vc
    }
}
