//
//  Collection + Extensions.swift
//  MyComics
//
//  Created by Антон Сивцов on 09.07.2023.
//

import Foundation

extension Collection {
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
