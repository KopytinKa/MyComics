//
//  ProfileContentViewDelegate.swift
//  MyComics
//
//  Created by Кирилл Копытин on 23.07.2023.
//

import Foundation

protocol ProfileContentViewDelegate: AnyObject {
    func logoutButtonPressed()
    func favoriteCharactersButtonPressed()
    func readComicsButtonPressed()
}
