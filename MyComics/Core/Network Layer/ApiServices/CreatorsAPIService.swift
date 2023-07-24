//
//  CreatorsAPIService.swift
//  Generic View Controller
//
//  Created by Антон Сивцов on 25.06.2023.
//

import Foundation

final class CreatorsAPIService: DefaultAPIService<CreatorEntity>, CreatorsAPI {
    
    // MARK: - Override
    
    override var initialPath: Path {
        .creators
    }
    
    // MARK: - CreatorsAPI
    
    func getAllContent(completion: @escaping ([CreatorEntity]?) -> Void) {
        makeAllContentRequest(completion: completion)
    }
    
    func getContent(by id: String, completion: @escaping (CreatorEntity?) -> Void) {
        makeContentRequest(by: id, completion: completion)
    }
    
    func getComics(by id: String, completion: @escaping ([ComicEntity]?) -> Void) {
        makeConcreteContentRequest(by: id, additionalPath: .comics, completion: completion)
    }
    
    func getEvents(by id: String, completion: @escaping ([EventEntity]?) -> Void) {
        makeConcreteContentRequest(by: id, additionalPath: .events, completion: completion)
    }
    
    func getSeries(by id: String, completion: @escaping ([SeriesEntity]?) -> Void) {
        makeConcreteContentRequest(by: id, additionalPath: .series, completion: completion)
    }
    
    func getStories(by id: String, completion: @escaping ([StoryEntity]?) -> Void) {
        makeConcreteContentRequest(by: id, additionalPath: .stories, completion: completion)
    }
}
