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
            
            print("(ComicsDataAdapter): Comics items loaded = \(String(describing: rawData?.count))")
        }
    }
    
    func getComicID(by indexPath: IndexPath) -> Int? {
        guard let entity = entities[safe: indexPath.item] else { return nil }
        return entity.id
    }
}

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
        
        print("(ComicsDataAdapter): Models setup = \(models.count)")
    }
    
    func setupModels(rawData: [ComicEntity]) -> [ComicsPresentableModel] {
        let configuredModels: [ComicsPresentableModel] = rawData.compactMap { data in
            return ComicsPresentableModel(
                title: data.title ?? "",
                author: "",
                image: .init(
                    imageURL: data.thumbnail?.path,
                    imageExtension: data.thumbnail?.extension
                )
            )
        }
        
        entities.append(contentsOf: rawData)
        models.append(contentsOf: configuredModels)
        
        print("(ComicsDataAdapter): entities.append -> \(rawData.count) items")
        print("(ComicsDataAdapter): models.append -> \(configuredModels.count) items")
        
        return models
    }
}
