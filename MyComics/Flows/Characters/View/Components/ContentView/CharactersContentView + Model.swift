//
//  CharactersContentView + Model.swift
//  MyComics
//
//  Created by Антон Сивцов on 02.07.2023.
//

import Foundation

extension CharactersContentView {
    struct Model: Hashable, Identifiable {
        let id: UUID = UUID()
        let title: String
        let image: AsyncImage
        let isLiked: Bool
    }
}
