//
//  CharactersDataAdapter.swift
//  MyComics
//
//  Created by Антон Сивцов on 02.07.2023.
//

import Foundation

final class CharactersDataAdapter: CharactersDataAdapterProtocol {
    
    // MARK: - Private Properties
    
    private var entities: [CharacterEntity] = []
    private var models: [CharacterPresentableModel] = []
    private var searchEntities: [CharacterEntity] = []
    
    // MARK: - Dependencies
    
    private let charactersAPI: any CharactersAPI
    
    // MARK: - Init
    
    init(charactersAPI: some CharactersAPI) {
        self.charactersAPI = charactersAPI
    }
    
    // MARK: - Public Methods
    
    func getData(completion: @escaping ([CharacterPresentableModel]) -> Void) {
        charactersAPI.getAllContent { [weak self] rawData in
            self?.processLoadedContent(rawData: rawData, completion: completion)
        }
    }
    
    func getNextPageData(completion: @escaping ([CharacterPresentableModel]) -> Void) {
        charactersAPI.loadNextPage { [weak self] rawData in
            self?.processLoadedContent(rawData: rawData, completion: completion)
        }
    }
    
    func getCharactersForText(
        _ text: String,
        completion: @escaping ([CharacterPresentableModel]) -> Void
    ) {
        charactersAPI.searchContentWith(text: text) { [weak self] rawData in
            self?.processSearchContent(rawData: rawData, completion: completion)
        }
    }
    
    func getCharacterID(by indexPath: IndexPath, isSearching: Bool) -> Int? {
        let entities = isSearching ? searchEntities : self.entities
        guard let entity = entities[safe: indexPath.item] else { return nil }
        return entity.id
    }
    
    func getLoadedContent() -> [CharacterPresentableModel] {
        return models
    }
}

// MARK: - Private Methods

private extension CharactersDataAdapter {
    func processLoadedContent(
        rawData: [CharacterEntity]?,
        completion: @escaping ([CharacterPresentableModel]) -> Void
    ) {
        guard let rawData else {
            completion(models)
            return
        }
        let models = setupModels(rawData: rawData)
        completion(models)
    }
    
    func processSearchContent(
        rawData: [CharacterEntity]?,
        completion: @escaping ([CharacterPresentableModel]) -> Void
    ) {
        self.searchEntities = rawData ?? []
        guard let rawData else {
            completion([])
            return
        }
        let models = rawData.map { makeModel(from: $0) }
        completion(models)
    }
    
    func setupModels(rawData: [CharacterEntity]) -> [CharacterPresentableModel] {
        let configuredModels: [CharacterPresentableModel] = rawData.map { makeModel(from: $0) }
        
        entities.append(contentsOf: rawData)
        models.append(contentsOf: configuredModels)
        return models
    }
    
    func makeModel(from entity: CharacterEntity) -> CharacterPresentableModel {
        return CharacterPresentableModel(
            title: entity.name ?? "",
            image: .init(
                imageURL: entity.thumbnail?.path,
                imageExtension: entity.thumbnail?.extension
            )
        )
    }
}
