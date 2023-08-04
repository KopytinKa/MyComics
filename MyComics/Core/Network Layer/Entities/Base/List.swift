//
//  List.swift
//  Generic View Controller
//
//  Created by Антон Сивцов on 25.06.2023.
//

import Foundation

struct List: Codable {
    let available: Int?
    let returned: Int?
    let collectionURI: String?
    let items: [ListSummary]?
    
    struct ListSummary: Codable {
        let resourceURI: String?
        let name: String?
        let type: String?
    }
}
