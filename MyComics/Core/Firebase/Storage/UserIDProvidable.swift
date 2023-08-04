//
//  UserIDProvidable.swift
//  MyComics
//
//  Created by Антон Сивцов on 30.07.2023.
//

import Foundation

protocol UserIDProvidable {
    func getCurentUserID() -> String?
}
