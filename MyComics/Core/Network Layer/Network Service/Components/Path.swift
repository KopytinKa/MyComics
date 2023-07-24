//
//  Path.swift
//  MyComics
//
//  Created by Антон Сивцов on 29.06.2023.
//

import Foundation

enum Path: String {
    case characters
    case comics
    case creators
    case events
    case series
    case stories
    
    enum Configuration {
        case id(String)
        case additionalPath(id: String, path: Path)
        case none
    }
}
