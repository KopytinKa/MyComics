//
//  PageableContent.swift
//  MyComics
//
//  Created by Антон Сивцов on 09.07.2023.
//

import Foundation

protocol PageableContent: Encodable {
    associatedtype Content: EntityPresentable
    func loadNextPage(completion: @escaping ([Content]?) -> Void)
}
