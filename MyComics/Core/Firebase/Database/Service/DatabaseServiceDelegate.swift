//
//  DatabaseServiceDelegate.swift
//  MyComics
//
//  Created by Кирилл Копытин on 23.07.2023.
//

import Foundation

protocol DatabaseServiceDelegate: AnyObject {
    func showError(with message: String)
    func showData(user: FirebaseUser)
}
