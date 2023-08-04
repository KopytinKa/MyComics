//
//  SeriesProvidable.swift
//  MyComics
//
//  Created by Антон Сивцов on 29.06.2023.
//

import Foundation

protocol SeriesProvidable {
    func getSeries(by id: Int, completion: @escaping ([SeriesEntity]?) -> Void)
}
