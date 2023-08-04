//
//  EventsAPIService.swift
//  MyComics
//
//  Created by Антон Сивцов on 28.06.2023.
//

import Foundation

final class EventsAPIService: DefaultAPIService<EventEntity>, EventsAPI {
    
    // MARK: - Override
    
    override var initialPath: Path {
        .events
    }
    
    // MARK: - EventsAPI
    
    func getAllContent(completion: @escaping ([EventEntity]?) -> Void) {
        makeAllContentRequest(completion: completion)
    }
    
    func getContent(by id: Int, completion: @escaping (EventEntity?) -> Void) {
        makeContentRequest(by: id, completion: completion)
    }
    
    func getComics(by id: Int, completion: @escaping ([ComicEntity]?) -> Void) {
        makeConcreteContentRequest(by: id, additionalPath: .comics, completion: completion)
    }
    
    func getCreators(by id: Int, completion: @escaping ([CreatorEntity]?) -> Void) {
        makeConcreteContentRequest(by: id, additionalPath: .creators, completion: completion)
    }
    
    func getSeries(by id: Int, completion: @escaping ([SeriesEntity]?) -> Void) {
        makeConcreteContentRequest(by: id, additionalPath: .series, completion: completion)
    }
    
    func getStories(by id: Int, completion: @escaping ([StoryEntity]?) -> Void) {
        makeConcreteContentRequest(by: id, additionalPath: .stories, completion: completion)
    }
}
