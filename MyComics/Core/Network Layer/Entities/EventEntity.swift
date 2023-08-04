//
//  EventEntity.swift
//  Generic View Controller
//
//  Created by Антон Сивцов on 25.06.2023.
//

import Foundation

struct EventEntity: EntityPresentable {
    let id: Int?
    let title: String?
    let description: String?
    let resourceURI: String?
    let urls: [Url]?
    let modified: String?
    let start: String?
    let end: String?
    let thumbnail: Image?
    let comics: List?
    let stories: List?
    let series: List?
    let characters: List?
    let creators: List?
    let next: List.ListSummary?
    let previous: List.ListSummary?
}
