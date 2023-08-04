//
//  SearchableContent.swift
//  MyComics
//
//  Created by Антон Сивцов on 16.07.2023.
//

import Foundation

protocol SearchableContent: Encodable {
    associatedtype Content: EntityPresentable
    func searchContentWith(text: String, completion: @escaping ([Content]?) -> Void)
}
