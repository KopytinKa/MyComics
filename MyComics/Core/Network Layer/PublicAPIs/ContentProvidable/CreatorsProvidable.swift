//
//  CreatorsProvidable.swift
//  MyComics
//
//  Created by Антон Сивцов on 29.06.2023.
//

import Foundation

protocol CreatorsProvidable {
    func getCreators(by id: Int, completion: @escaping ([CreatorEntity]?) -> Void)
}
