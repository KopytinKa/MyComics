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
    
    private let dataAdapter: ComicsDataAdapterProtocol
    private let coordinator: DetailSupportableCoordinator
    
    // MARK: - Init
    
    init(dataAdapter: ComicsDataAdapterProtocol,
         coordinator: DetailSupportableCoordinator) {
        self.dataAdapter = dataAdapter
        self.coordinator = coordinator
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
            guard let self = self else {
                return
            }
            
            if models.isEmpty {
                self.view?.showAlert(with: "No comics data loaded")
            } else {
                self.view?.update(models: models)
            }
        }
    }
}

// MARK: - ComicsViewOutput

extension ComicsPresenter: ComicsViewOutput {
    func viewIsReady() {
        dataAdapter.getData { [weak self] models in
            guard let self = self else {
                return
            }
            
            self.updateView(with: models)
        }
    }
    
    func didTapCell(_ indexPath: IndexPath) {
        guard let id = dataAdapter.getItemID(at: indexPath) else { return }
        coordinator.openDetailScreen(id: id)
    }
}
