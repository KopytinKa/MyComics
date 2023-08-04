//
//  CharacterDetailViewOutput.swift
//  MyComics
//
//  Created by Andrey Piskunov on 10.07.2023.
//

import Foundation

protocol DetailCharacterViewOutput: AnyObject {
    func viewIsReady()
    func didTapLikeButton()
}
