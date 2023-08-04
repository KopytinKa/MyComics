//
//  URLComponents + Extensions.swift
//  MyComics
//
//  Created by Антон Сивцов on 29.06.2023.
//

import Foundation

extension URLComponents {
    init?(base: String, path: Path, pathConfiguration: Path.Configuration?) {
        var mutableString = base + path.rawValue
        
        switch pathConfiguration {
        case .id(let id):
            mutableString += "/\(id)"
        case .additionalPath(let id, let path):
            mutableString += "/\(id)" + "/\(path.rawValue)"
        default:
            break
        }
        
        self.init(string: mutableString)
    }
}
