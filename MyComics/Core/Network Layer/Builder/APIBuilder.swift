//
//  APIBuilder.swift
//  MyComics
//
//  Created by Антон Сивцов on 30.06.2023.
//

import Foundation

final class APIBuilder {
    
    static let shared = APIBuilder()
    // MARK: - Private Properties
    
    private let networkService: NetworkService
    
    // MARK: - Init
    
    private init() {
        self.networkService = .init()
    }

    func makeSeriesAPI() -> any SeriesAPI {
        let requestConfigurator = APIRequestConfigurator<SeriesEntity>(networkService: networkService)
        let service = SeriesAPIService(apiRequestConfigurator: requestConfigurator)
        return service
    }
    
    func makeComicsAPI() -> any ComicsAPI {
        let requestConfigurator = APIRequestConfigurator<ComicEntity>(networkService: networkService)
        let service = ComicsAPIService(apiRequestConfigurator: requestConfigurator)
        return service
    }
    
    func makeCharactersAPI() -> any CharactersAPI {
        let requestConfigurator = APIRequestConfigurator<CharacterEntity>(networkService: networkService)
        let service = CharactersAPIService(apiRequestConfigurator: requestConfigurator)
        return service
    }
    
    func makeEventsAPI() -> any EventsAPI {
        let requestConfigurator = APIRequestConfigurator<EventEntity>(networkService: networkService)
        let service = EventsAPIService(apiRequestConfigurator: requestConfigurator)
        return service
    }
    
    func makeStoriesAPI() -> any StoriesAPI {
        let requestConfigurator = APIRequestConfigurator<StoryEntity>(networkService: networkService)
        let service = StoriesAPIService(apiRequestConfigurator: requestConfigurator)
        return service
    }
    
    func makeCreatorsAPI() -> any CreatorsAPI {
        let requestConfigurator = APIRequestConfigurator<CreatorEntity>(networkService: networkService)
        let service = CreatorsAPIService(apiRequestConfigurator: requestConfigurator)
        return service
    }
}
