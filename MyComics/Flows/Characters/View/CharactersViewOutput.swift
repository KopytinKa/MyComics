//
//  CharactersViewOutput.swift
//  MyComics
//
//  Created by Кирилл Копытин on 28.06.2023.
//

import Foundation

protocol CharactersViewOutput: AnyObject {
    func viewIsReady()
    func loadNextPage()
    func didTapLike(_ indexPath: IndexPath)
    func didTapCell(_ indexPath: IndexPath)
    func searchTextDidChange(_ text: String)
    func cancelButtonClicked()
}
