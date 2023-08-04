//
//  AuthViewOutput.swift
//  MyComics
//
//  Created by Кирилл Копытин on 23.07.2023.
//

import Foundation

protocol AuthViewOutput: AnyObject {
    func viewIsReady()
    func enterButtonPressed(name: String?, email: String?, password: String?)
    func switchLoginButtonPressed()
}
