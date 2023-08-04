//
//  APIRequestConfigurator.swift
//  MyComics
//
//  Created by Антон Сивцов on 29.06.2023.
//

import Foundation

final class APIRequestConfigurator<T: EntityPresentable> {
    
    // MARK: - Properties
    
    private let networkService: NetworkService
    
    // MARK: - Init
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    // MARK: - Public Methods
    
    func requestEntities<U: EntityPresentable>(
        path: Path,
        id: Int? = nil,
        additionalPath: Path? = nil,
        completion: @escaping ([U]?) -> Void
    ) {
        let configuration: NetworkService.Configutation

        if let id, let additionalPath {
            configuration = .init(initialPath: path, additionalPath: .additionalPath(id: id, path: additionalPath))
        } else if let id {
            configuration = .init(initialPath: path, additionalPath: .id(id))
        } else {
            configuration = .init(initialPath: path)
        }
        
        networkService.makeEntitiesRequest(configuration: configuration, completion: completion)
    }
    
    func requestNextPage<U: EntityPresentable>(
        path: Path,
        offset: Int,
        pageLimit: Int,
        completion: @escaping ([U]?) -> Void
    ) {
        let parameters: RequestParameters = .init(offset: offset, limit: pageLimit)
        networkService.makeRequestWithParameters(path: path, parameters, completion: completion)
    }
    
    func requestSearchContent<U: EntityPresentable>(
        path: Path,
        text: String,
        completion: @escaping ([U]?) -> Void
    ) {
        let parameters: RequestParameters = .init(search: .init(path: path, text: text))
        networkService.makeRequestWithParameters(path: path, parameters, completion: completion)
    }
}
