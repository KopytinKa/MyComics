//
//  CharacterLikesStorage.swift
//  MyComics
//
//  Created by Антон Сивцов on 30.07.2023.
//

import Foundation

final class CharacterLikesStorage: LikesStorage {
    override init(userProvider: UserIDProvidable) {
        super.init(userProvider: userProvider)
        setSpecificationKey("characters_likes_dictionary")
    }
}
