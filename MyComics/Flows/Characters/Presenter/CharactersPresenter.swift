//
//  CharactersPresenter.swift
//  MyComics
//
//  Created by Кирилл Копытин on 28.06.2023.
//

import Foundation

final class CharactersPresenter {
    
    // MARK: - Properties
    
    weak var view: CharactersViewInput?
    
    // MARK: - Private Properties
    
    private var isSearching = false
    
    // MARK: - Dependencies
    
    private let notificationCenter: NotificationCenter
    private let coordinator: CharactersCoordinator
    private let dataAdapter: CharactersDataAdapterProtocol
    private let likesManager: LikesManager
    
    // MARK: - Init
    
    init(coordinator: CharactersCoordinator,
         dataAdapter: CharactersDataAdapterProtocol,
         likesManager: LikesManager) {
        self.notificationCenter = NotificationCenter.default
        self.coordinator = coordinator
        self.dataAdapter = dataAdapter
        self.likesManager = likesManager
        
        notificationCenter.addObserver(forName: .itemWasLikedOrDislike, object: nil, queue: .main) { [weak self] _ in
            guard let self else { return }
            let content = self.dataAdapter.getUpdatedContent()
            self.updateView(with: content)
        }
    }
    
    deinit {
        notificationCenter.removeObserver(self, name: .itemWasLikedOrDislike, object: nil)
    }
}

// MARK: - Private Methods -

private extension CharactersPresenter {
    func updateView(with models: [CharacterPresentableModel]) {
        let models: [CharactersContentView.Model] = models.map {
            .init(title: $0.title, image: $0.image, isLiked: $0.isLiked)
        }
        
        DispatchQueue.main.async { [weak self] in
            self?.view?.update(models: models)
        }
    }
}

// MARK: - CharactersViewOutput -

extension CharactersPresenter: CharactersViewOutput {
    func searchTextDidChange(_ text: String) {
        dataAdapter.getCharactersForText(text) { [weak self] models in
            self?.isSearching = !text.isEmpty
            DispatchQueue.main.async {
                if models.isEmpty && !text.isEmpty {
                    self?.view?.showEmptySearchPlaceholder()
                } else {
                    self?.view?.removeEmptySearchPlaceholder()
                }
            }
            self?.updateView(with: models)
        }
    }
    
    func cancelButtonClicked() {
        self.isSearching = false
        DispatchQueue.main.async { [weak self] in
            self?.view?.removeEmptySearchPlaceholder()
            let loadedModels = self?.dataAdapter.getLoadedContent() ?? []
            self?.updateView(with: loadedModels)
        }
    }
    
    func viewIsReady() {
        dataAdapter.getData { [weak self] models in
            self?.updateView(with: models)
        }
    }
    
    func loadNextPage() {
        guard isSearching == false else { return }
        dataAdapter.getNextPageData { [weak self] models in
            self?.updateView(with: models)
        }
    }
    
    func didTapLike(_ indexPath: IndexPath) {
        // TODO: 4.9 implement logic
        guard let characterID = dataAdapter.getCharacterID(by: indexPath, isSearching: isSearching) else { return }
        
        likesManager.saveLike(characterID)
    }
    
    func didTapCell(_ indexPath: IndexPath) {
        guard let characterID = dataAdapter.getCharacterID(by: indexPath, isSearching: isSearching) else { return }
        coordinator.openDetailScreen(characterID: characterID)
    }
}
