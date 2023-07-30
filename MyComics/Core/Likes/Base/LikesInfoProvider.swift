//
//  LikesInfoProvider.swift
//  MyComics
//
//  Created by Антон Сивцов on 30.07.2023.
//

import Foundation

protocol LikesInfoProvider {
    func isLiked(_ id: Int?) -> Bool
}
