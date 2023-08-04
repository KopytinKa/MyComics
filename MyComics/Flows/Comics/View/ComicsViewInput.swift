//
//  ComicsViewInput.swift
//  MyComics
//
//  Created by Кирилл Копытин on 28.06.2023.
//

import Foundation

protocol ComicsViewInput: AnyObject {
    func update(models: [ComicsContentView.Model])
    func showAlert(with message: String)
}
