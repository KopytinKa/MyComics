//
//  AsyncImage.swift
//  MyComics
//
//  Created by Антон Сивцов on 02.07.2023.
//

import Foundation

struct AsyncImage: Hashable, Identifiable {
    let id: UUID = UUID()
    let imageURL: String?
    let imageExtension: String?
}
