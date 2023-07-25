//
//  ComicsDataAdapterProtocol.swift
//  MyComics
//
//  Created by Алексей Артамонов on 16.07.2023.
//

import Foundation

protocol ComicsDataAdapterProtocol {
    func getData(completion: @escaping ([ComicsPresentableModel]) -> Void)
    func getItemID(at indexPath: IndexPath) -> Int? 
}
