//
//  ComicsPresenter.swift
//  MyComics
//
//  Created by Кирилл Копытин on 28.06.2023.
//

import Foundation

final class ComicsPresenter {
    
    // MARK: - Properties
    
    weak var view: ComicsViewInput?
    
    // MARK: - Dependencies
    
    private let coordinator: ComicsCoordinator
    let dataAdapter: ComicsDataAdapterProtocol
    
    // MARK: - Init
    
    init(coordinator: ComicsCoordinator, dataAdapter: ComicsDataAdapterProtocol) {
        self.coordinator = coordinator
        self.dataAdapter = dataAdapter
    }
}

// MARK: - Private Methods -

private extension ComicsPresenter {
    func updateView(with models: [ComicsPresentableModel]) {
        let models: [ComicsContentView.Model] = models.map {
            .init(title: $0.title,
                  author: $0.author,
                  image: $0.image)
        }
        
        DispatchQueue.main.async { [weak self] in
            self?.view?.update(models: models)
        }
    }
}

// MARK: - ComicsViewOutput

extension ComicsPresenter: ComicsViewOutput {
    func viewIsReady() {
        dataAdapter.getData { [weak self] models in
            self?.updateView(with: models)
        }
    }
    
    func didTapCell(_ indexPath: IndexPath) {
        guard let comicID = dataAdapter.getComicID(by: indexPath) else { return }
        coordinator.openDetailScreen(comicID: comicID)
    }
}
