//
//  ContentProvidable.swift
//  MyComics
//
//  Created by Антон Сивцов on 29.06.2023.
//

import Foundation

protocol ContentProvidable {
    associatedtype Content: EntityPresentable
    func getAllContent(completion: @escaping ([Content]?) -> Void)
    func getContent(by id: Int, completion: @escaping (Content?) -> Void)
}
