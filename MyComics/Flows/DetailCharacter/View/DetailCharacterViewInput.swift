//
//  CharacterDetailViewInput.swift
//  MyComics
//
//  Created by Andrey Piskunov on 10.07.2023.
//

import Foundation

protocol DetailCharacterViewInput: AnyObject {
    func updateView(model: DetailCharacterModel)
}
