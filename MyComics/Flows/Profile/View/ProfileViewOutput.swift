//
//  ProfileViewOutput.swift
//  MyComics
//
//  Created by Кирилл Копытин on 28.06.2023.
//

import Foundation

protocol ProfileViewOutput: AnyObject {
    func viewIsReady()
    func logoutButtonPressed()
    func favoriteCharactersButtonPressed()
    func readComicsButtonPressed()
}
