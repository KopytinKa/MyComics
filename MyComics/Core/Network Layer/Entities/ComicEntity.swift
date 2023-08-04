//
//  ComicEntity.swift
//  Generic View Controller
//
//  Created by Антон Сивцов on 25.06.2023.
//

import Foundation

struct ComicEntity: EntityPresentable {
    let id: Int?
    let digitalId: Int?
    let title: String?
    let issueNumber: Double?
    let variantDescription: String?
    let description: String?
    let modified: String?
    let isbn: String?
    let upc: String?
    let diamondCode: String?
    let ean: String?
    let issn: String?
    let format: String?
    let pageCount: Int?
    let textObjects: [TextObject]
    let resourceURI: String?
    let urls: [Url]?
    let series: List.ListSummary?
    let variants: [List.ListSummary]?
    let collections: [List.ListSummary]?
    let collectedIssues: [List.ListSummary]?
    let dates: [ComicDate]?
    let prices: [ComicPrice]?
    let thumbnail: Image?
    let images: [Image]?
    let creators: List?
    let characters: List?
    let stories: List?
    let events: List?
    
    struct TextObject: Codable {
        let type: String?
        let language: String?
        let text: String?
    }
    
    struct ComicDate: Codable {
        let type: String?
        let date: String?
    }
    
    struct ComicPrice: Codable {
        let type: String?
        let price: Float?
    }
}
