//
//  CharacterEntity.swift
//  Generic View Controller
//
//  Created by Антон Сивцов on 25.06.2023.
//

import Foundation

struct CharacterEntity: EntityPresentable {
    let id: Int?
    let name: String?
    let description: String?
    let modified: String?
    let resourceURI: String?
    let urls: [Url]?
    let thumbnail: Image?
    let comics: List?
    let stories: List?
    let events: List?
    let series: List?
}
