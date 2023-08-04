//
//  CharactersSearchControllerDelegate.swift
//  MyComics
//
//  Created by Антон Сивцов on 16.07.2023.
//

import Foundation

protocol CharactersSearchControllerDelegate: AnyObject {
    func textDidChange(_ text: String)
    func cancelButtonClicked()
}
