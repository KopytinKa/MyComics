//
//  SeriesEntity.swift
//  Generic View Controller
//
//  Created by Антон Сивцов on 25.06.2023.
//

import Foundation

struct SeriesEntity: EntityPresentable {
    let id: Int?
    let title: String?
    let description: String?
    let resourceURI: String?
    let urls: [Url]?
    let startYear: Int?
    let endYear: Int?
    let rating: String?
    let modified: String?
    let thumbnail: Image?
    let comics: List?
    let stories: List?
    let events: List?
    let characters: List?
    let creators: List?
    let next: List.ListSummary?
    let previous: List.ListSummary?
}
