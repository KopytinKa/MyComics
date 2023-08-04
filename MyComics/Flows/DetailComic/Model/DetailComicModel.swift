//
//  DetailComicModel.swift
//  MyComics
//
//  Created by Andrey Piskunov on 19.07.2023.
//

import Foundation

struct DetailComicModel: Hashable {
    let id: Int?
    let title: String?
    let description: String?
    let image: AsyncImage?
}
