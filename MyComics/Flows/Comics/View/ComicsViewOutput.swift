//
//  ComicsViewOutput.swift
//  MyComics
//
//  Created by Кирилл Копытин on 28.06.2023.
//

import Foundation

protocol ComicsViewOutput: AnyObject {
    func viewIsReady()
    func didTapCell(_ indexPath: IndexPath)
}
