//
//  AuthServiceProtocol.swift
//  MyComics
//
//  Created by Кирилл Копытин on 23.07.2023.
//

import Foundation

protocol AuthServiceProtocol {
    var delegate: AuthServiceDelegate? { get set }
    func login(email: String, password: String)
    func register(name: String, email: String, password: String)
    func logout()
    func checkAuth()
}
