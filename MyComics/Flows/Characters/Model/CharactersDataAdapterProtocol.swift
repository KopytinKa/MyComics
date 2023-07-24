//
//  CharactersDataAdapterProtocol.swift
//  MyComics
//
//  Created by Антон Сивцов on 02.07.2023.
//

import Foundation

protocol CharactersDataAdapterProtocol {
    func getData(completion: @escaping ([CharacterPresentableModel]) -> Void)
    func getNextPageData(completion: @escaping ([CharacterPresentableModel]) -> Void)
    func getCharacterID(by indexPath: IndexPath) -> Int?
}
