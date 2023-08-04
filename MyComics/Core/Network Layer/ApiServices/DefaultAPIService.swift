//
//  DefaultAPIService.swift
//  Generic View Controller
//
//  Created by Антон Сивцов on 25.06.2023.
//

import Foundation

// MARK: - Constants

private enum Constants {
    static var pageLimit = 20
}

class DefaultAPIService<T: EntityPresentable> {
    
    // MARK: - Public Properties
    
    var currentPageOffset: Int = 0
    
    var initialPath: Path {
        fatalError("Should be overriden")
    }
    
    // MARK: - Dependencies
    
    private let apiRequestConfigurator: APIRequestConfigurator<T>
    
    // MARK: - Init
    
    init(apiRequestConfigurator: APIRequestConfigurator<T>) {
        self.apiRequestConfigurator = apiRequestConfigurator
    }
    
    // MARK: - Public Methods
    
    func makeAllContentRequest(
        completion: @escaping ([T]?) -> Void
    ) {
        apiRequestConfigurator.requestEntities(path: initialPath, completion: completion)
    }
    
    func makeContentRequest(by id: Int, completion: @escaping (T?) -> Void) {
        apiRequestConfigurator.requestEntities(path: initialPath, id: id) { entities in
            completion(entities?.first)
        }
    }
    
    func makeConcreteContentRequest<U: EntityPresentable>(
        by id: Int,
        additionalPath: Path,
        completion: @escaping ([U]?) -> Void
    ) {
        apiRequestConfigurator.requestEntities(
            path: initialPath,
            id: id,
            additionalPath: additionalPath,
            completion: completion
        )
    }
    
    func makeLoadNextPageRequest(completion: @escaping ([T]?) -> Void) {
        currentPageOffset += Constants.pageLimit
        apiRequestConfigurator.requestNextPage(
            path: initialPath,
            offset: currentPageOffset,
            pageLimit: Constants.pageLimit,
            completion: completion
        )
    }
    
    func makeSearchRequest(text: String, completion: @escaping ([T]?) -> Void) {
        apiRequestConfigurator.requestSearchContent(path: initialPath, text: text, completion: completion)
    }
}
