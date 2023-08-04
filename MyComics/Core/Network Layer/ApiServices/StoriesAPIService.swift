//
//  StoriesAPIService.swift
//  MyComics
//
//  Created by Антон Сивцов on 29.06.2023.
//

import Foundation

final class StoriesAPIService: DefaultAPIService<StoryEntity>, StoriesAPI {
    
    // MARK: - Override
    
    override var initialPath: Path {
        .stories
    }
    
    // MARK: - StoriesAPI
    
    func getAllContent(completion: @escaping ([StoryEntity]?) -> Void) {
        makeAllContentRequest(completion: completion)
    }
    
    func getContent(by id: Int, completion: @escaping (StoryEntity?) -> Void) {
        makeContentRequest(by: id, completion: completion)
    }
    
    func getCharacters(by id: Int, completion: @escaping ([CharacterEntity]?) -> Void) {
        makeConcreteContentRequest(by: id, additionalPath: .characters, completion: completion)
    }
    
    func getComics(by id: Int, completion: @escaping ([ComicEntity]?) -> Void) {
        makeConcreteContentRequest(by: id, additionalPath: .comics, completion: completion)
    }
    
    func getCreators(by id: Int, completion: @escaping ([CreatorEntity]?) -> Void) {
        makeConcreteContentRequest(by: id, additionalPath: .creators, completion: completion)
    }
    
    func getEvents(by id: Int, completion: @escaping ([EventEntity]?) -> Void) {
        makeConcreteContentRequest(by: id, additionalPath: .events, completion: completion)
    }
    
    func getSeries(by id: Int, completion: @escaping ([SeriesEntity]?) -> Void) {
        makeConcreteContentRequest(by: id, additionalPath: .series, completion: completion)
    }
}
