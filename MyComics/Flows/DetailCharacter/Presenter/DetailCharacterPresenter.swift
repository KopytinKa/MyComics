//
//  CharacterDetailPresenter.swift
//  MyComics
//
//  Created by Andrey Piskunov on 10.07.2023.
//

import Foundation

final class DetailCharacterPresenter {
    
    // MARK: - Properties
    
    private let id: Int
    weak var view: DetailCharacterViewInput?
    
    // MARK: - Dependency
    
    private let characterAPIService: any CharactersAPI
    
    // MARK: - Init
    
    init(id: Int, characterAPIService: any CharactersAPI) {
        self.id = id
        self.characterAPIService = characterAPIService
    }
    
    // MARK: - Private methods
    
    private func loadCharacter() {
        characterAPIService.getContent(by: id) { [weak self] character in
            let model = DetailCharacterModel(
                id: character?.id,
                name: character?.name,
                description: character?.description,
                image: AsyncImage(
                    imageURL: character?.thumbnail?.path,
                    imageExtension: character?.thumbnail?.extension
                )
            )
            DispatchQueue.main.async {
                self?.view?.updateView(model: model)
            }
        }
    }
}

// MARK: - DetailCharacterViewOutput

extension DetailCharacterPresenter: DetailCharacterViewOutput {
    func viewIsReady() {
        loadCharacter()
    }
}
