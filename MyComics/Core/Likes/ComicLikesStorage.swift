//
//  ComicLikesStorage.swift
//  MyComics
//
//  Created by Антон Сивцов on 30.07.2023.
//

import Foundation

final class ComicLikesStorage: LikesStorage {
    override init(userProvider: UserIDProvidable) {
        super.init(userProvider: userProvider)
        setSpecificationKey("comics_likes_dictionary")
    }
}
