//
//  CharactersAPIService.swift
//  Generic View Controller
//
//  Created by Антон Сивцов on 25.06.2023.
//

import Foundation

final class CharactersAPIService: DefaultAPIService<CharacterEntity>, CharactersAPI {
    
    // MARK: - Override
    
    override var initialPath: Path {
        .characters
    }
    
    // MARK: - CharactersAPI
    
    func getAllContent(completion: @escaping ([CharacterEntity]?) -> Void) {
        makeAllContentRequest(completion: completion)
    }
    
    func getContent(by id: Int, completion: @escaping (CharacterEntity?) -> Void) {
        makeContentRequest(by: id, completion: completion)
    }
    
    func getComics(by id: Int, completion: @escaping ([ComicEntity]?) -> Void) {
        makeConcreteContentRequest(by: id, additionalPath: .comics, completion: completion)
    }
    
    func getEvents(by id: Int, completion: @escaping ([EventEntity]?) -> Void) {
        makeConcreteContentRequest(by: id, additionalPath: .events, completion: completion)
    }
    
    func getSeries(by id: Int, completion: @escaping ([SeriesEntity]?) -> Void) {
        makeConcreteContentRequest(by: id, additionalPath: .series, completion: completion)
    }
    
    func getStories(by id: Int, completion: @escaping ([StoryEntity]?) -> Void) {
        makeConcreteContentRequest(by: id, additionalPath: .stories, completion: completion)
    }
    
    // MARK: - PagableContent
    
    func loadNextPage(completion: @escaping ([CharacterEntity]?) -> Void) {
        makeLoadNextPageRequest(completion: completion)
    }
    
    // MARK: - SearchableContent
    
    func searchContentWith(text: String, completion: @escaping ([CharacterEntity]?) -> Void) {
        makeSearchRequest(text: text, completion: completion)
    }
}
