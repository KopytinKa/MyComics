//
//  EntityWrapper.swift
//  Generic View Controller
//
//  Created by Антон Сивцов on 25.06.2023.
//

import Foundation

struct EntityWrapper<T: EntityPresentable>: Codable {
    let code: Int?
    let status: String?
    let copyright: String?
    let attributionText: String?
    let attributionHTML: String?
    let data: EntityContainer?
    let etag: String?
    
    struct EntityContainer: Codable {
        let offset: Int?
        let limit: Int?
        let total: Int?
        let count: Int?
        let results: [T]?
    }
    
    static func light() -> EntityWrapper<T> {
        EntityWrapper<T>(
            code: nil,
            status: nil,
            copyright: nil,
            attributionText: nil,
            attributionHTML: nil,
            data: nil,
            etag: nil
        )
    }
}
