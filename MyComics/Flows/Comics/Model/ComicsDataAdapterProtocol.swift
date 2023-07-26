//
//  ComicsDataAdapterProtocol.swift
//  MyComics
//
//  Created by Алексей Артамонов on 16.07.2023.
//

import Foundation

protocol ComicsDataAdapterProtocol {
    func getData(completion: @escaping ([ComicsPresentableModel]) -> Void)
    func getComicID(by indexPath: IndexPath) -> Int?
}
