//
//  CharactersViewInput.swift
//  MyComics
//
//  Created by Кирилл Копытин on 28.06.2023.
//

import Foundation

protocol CharactersViewInput: AnyObject {
    func update(models: [CharactersContentView.Model])
    func showEmptySearchPlaceholder()
    func removeEmptySearchPlaceholder()
}
