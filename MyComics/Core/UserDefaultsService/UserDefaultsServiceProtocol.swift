//
//  UserDefaultsServiceProtocol.swift
//  MyComics
//
//  Created by Кирилл Копытин on 23.07.2023.
//

import Foundation

protocol UserDefaultsServiceProtocol {
    func set(key: String, value: Any?)
    func integer(key: String) -> Int
    func string(key: String) -> String
    func bool(key: String) -> Bool
    func remove(key: String)
}
