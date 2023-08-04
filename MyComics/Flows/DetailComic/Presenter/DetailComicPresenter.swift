//
//  DetailComicPresenter.swift
//  MyComics
//
//  Created by Andrey Piskunov on 17.07.2023.
//

import Foundation

final class DetailComicPresenter {
    
    // MARK: - Properties
    
    private let id: Int
    weak var view: DetailComicViewInput?
    
    // MARK: - Dependency
    
    private let comicAPIService: any ComicsAPI
    
    // MARK: - Init
    
    init(id: Int, comicAPIService: any ComicsAPI) {
        self.id = id
        self.comicAPIService = comicAPIService
    }
    
    // MARK: - Private methods

    private func loadComic() {
        comicAPIService.getContent(by: id) { [weak self] comic in
            let model = DetailComicModel(id: comic?.id,
                                         title: comic?.title,
                                         description: comic?.description,
                                         image: AsyncImage(imageURL: comic?.thumbnail?.path,
                                                           imageExtension: comic?.thumbnail?.extension))
            DispatchQueue.main.async {
                self?.view?.updateView(model: model)
            }
        }
    }
}

// MARK: - DetailComicViewOutput

extension DetailComicPresenter: DetailComicViewOutput {
    func viewIsReady() {
        loadComic()
    }
}
