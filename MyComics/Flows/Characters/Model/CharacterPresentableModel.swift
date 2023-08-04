//
//  CharacterPresentableModel.swift
//  MyComics
//
//  Created by Антон Сивцов on 02.07.2023.
//

import Foundation

struct CharacterPresentableModel {
    let id: String
    let title: String
    let image: AsyncImage
    var isLiked: Bool
}
