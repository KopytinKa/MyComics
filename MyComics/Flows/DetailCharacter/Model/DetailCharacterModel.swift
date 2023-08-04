//
//  DetailCharacterModel.swift
//  MyComics
//
//  Created by Andrey Piskunov on 14.07.2023.
//

import Foundation

struct DetailCharacterModel: Hashable {
    let id: Int?
    let name: String?
    let description: String?
    let image: AsyncImage?
    var isLiked: Bool
}
