//
//  ComicsDataAdapter.swift
//  MyComics
//
//  Created by Алексей Артамонов on 16.07.2023.
//

import Foundation

final class ComicsDataAdapter: ComicsDataAdapterProtocol {
    
    // MARK: - Private properties
    
    private var entities: [ComicEntity] = []
    private var models: [ComicsPresentableModel] = []
    private var searchEntities: [ComicEntity] = []
    private var comicsViewCell = ComicsCollectionViewCell()
    
    // MARK: - Dependencies
    
    private let comicsAPI: any ComicsAPI
    
    // MARK: - Init
    
    init(comicsAPI: some ComicsAPI) {
        self.comicsAPI = comicsAPI
    }
    
    func getData(completion: @escaping ([ComicsPresentableModel]) -> Void) {
        comicsAPI.getAllContent { [weak self] rawData in
            guard let self = self else {
                return
            }
            
            self.processLoadedContent(rawData: rawData, completion: completion)
        }
    }
    
    func getComicsID(by indexPath: IndexPath, isSearching: Bool) -> Int? {
        let entities = isSearching ? searchEntities : self.entities
        guard let entity = entities[safe: indexPath.item] else { return nil }
        return entity.id
    }
}

// MARK: - Private methods

private extension ComicsDataAdapter {
    func processLoadedContent(
        rawData: [ComicEntity]?,
        completion: @escaping ([ComicsPresentableModel]) -> Void
    ) {
        guard let rawData else {
            completion(models)
            return
        }
        let models = setupModels(rawData: rawData)
        completion(models)
    }
    
    func setupModels(rawData: [ComicEntity]) -> [ComicsPresentableModel] {
        let configuredModels: [ComicsPresentableModel] = rawData.compactMap { data in
            return ComicsPresentableModel(
                title: data.title ?? "",
                author: data.creators?.items?.first?.name ?? "",
                image: .init(
                    imageURL: data.thumbnail?.path,
                    imageExtension: data.thumbnail?.extension
                )
            )
        }
        
        entities.append(contentsOf: rawData)
        models.append(contentsOf: configuredModels)
        
        return models
    }
}
