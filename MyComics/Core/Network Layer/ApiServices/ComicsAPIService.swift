//
//  ComicsAPIService.swift
//  Generic View Controller
//
//  Created by Антон Сивцов on 25.06.2023.
//

import Foundation

final class ComicsAPIService: DefaultAPIService<ComicEntity>, ComicsAPI {
    
    // MARK: - Override
    
    override var initialPath: Path {
        .comics
    }
    
    // MARK: - ComicsAPI
    
    func getAllContent(completion: @escaping ([ComicEntity]?) -> Void) {
        makeAllContentRequest(completion: completion)
    }
    
    func getContent(by id: Int, completion: @escaping (ComicEntity?) -> Void) {
        makeContentRequest(by: id, completion: completion)
    }
    
    func getStories(by id: Int, completion: @escaping ([StoryEntity]?) -> Void) {
        makeConcreteContentRequest(by: id, additionalPath: .stories, completion: completion)
    }
    
    func getCharacters(by id: Int, completion: @escaping ([CharacterEntity]?) -> Void) {
        makeConcreteContentRequest(by: id, additionalPath: .characters, completion: completion)
    }
    
    func getCreators(by id: Int, completion: @escaping ([CreatorEntity]?) -> Void) {
        makeConcreteContentRequest(by: id, additionalPath: .creators, completion: completion)
    }
    
    func getEvents(by id: Int, completion: @escaping ([EventEntity]?) -> Void) {
        makeConcreteContentRequest(by: id, additionalPath: .events, completion: completion)
    }
}
