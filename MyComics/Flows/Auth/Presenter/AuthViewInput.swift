//
//  AuthViewInput.swift
//  MyComics
//
//  Created by Кирилл Копытин on 23.07.2023.
//

import Foundation

protocol AuthViewInput: AnyObject {
    func configure(isLogin: Bool)
    func showAlert(with message: String)
}
