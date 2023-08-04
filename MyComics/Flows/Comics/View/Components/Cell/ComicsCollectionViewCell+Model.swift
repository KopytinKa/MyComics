//
//  Model.swift
//  MyComics
//
//  Created by Алексей Артамонов on 16.07.2023.
//

import Foundation

extension ComicsCollectionViewCell {
    struct Model: Hashable {
        let title: String
        let author: String
        let image: AsyncImage?
    }
}
