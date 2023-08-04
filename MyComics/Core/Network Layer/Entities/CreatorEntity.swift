//
//  CreatorEntity.swift
//  Generic View Controller
//
//  Created by Антон Сивцов on 25.06.2023.
//

import Foundation

struct CreatorEntity: EntityPresentable {
    let id: Int?
    let firstName: String?
    let middleName: String?
    let lastName: String?
    let suffix: String?
    let fullName: String
    let modified: String?
    let resourceURI: String?
    let urls: [Url]?
    let thumbnail: Image?
    let series: List?
    let stories: List?
    let comics: List?
    let events: List?
}
