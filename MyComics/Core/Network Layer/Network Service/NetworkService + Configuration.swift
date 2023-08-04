//
//  NetworkService + Configuration.swift
//  MyComics
//
//  Created by Антон Сивцов on 29.06.2023.
//

import Foundation

extension NetworkService {
    struct Configutation {
        let initialPath: Path
        let additionalPath: Path.Configuration?
        
        init(initialPath: Path, additionalPath: Path.Configuration? = nil) {
            self.initialPath = initialPath
            self.additionalPath = additionalPath
        }
    }
}
