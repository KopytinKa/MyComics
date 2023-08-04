//
//  StoryEntity.swift
//  Generic View Controller
//
//  Created by Антон Сивцов on 25.06.2023.
//

import Foundation

struct StoryEntity: EntityPresentable {
    let id: Int?
    let title: String?
    let description: String?
    let resourceURI: String?
    let type: String?
    let modified: String?
    let thumbnail: Image?
    let comics: List?
    let series: List?
    let events: List?
    let characters: List?
    let creators: List?
    let originalissue: List.ListSummary?
}
