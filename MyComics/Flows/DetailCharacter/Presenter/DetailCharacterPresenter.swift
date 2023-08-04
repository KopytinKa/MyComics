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
    
    private let notificationCenter: NotificationCenter
    private let characterAPIService: any CharactersAPI
    private let likesManager: LikesInfoProvider & LikesManager
    
    // MARK: - Init
    
    init(id: Int,
         characterAPIService: any CharactersAPI,
         likesManager: LikesInfoProvider & LikesManager) {
        self.notificationCenter = NotificationCenter.default
        self.id = id
        self.characterAPIService = characterAPIService
        self.likesManager = likesManager
    }
    
    // MARK: - Private methods
    
    private func loadCharacter() {
        let isLiked = likesManager.isLiked(self.id)
        characterAPIService.getContent(by: id) { [weak self] character in
            let model = DetailCharacterModel(
                id: character?.id,
                name: character?.name,
                description: character?.description,
                image: AsyncImage(
                    imageURL: character?.thumbnail?.path,
                    imageExtension: character?.thumbnail?.extension
                ),
                isLiked: isLiked
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
    
    func didTapLikeButton() {
        likesManager.saveLike(id)
        notificationCenter.post(name: .itemWasLikedOrDislike, object: nil)
    }
}
