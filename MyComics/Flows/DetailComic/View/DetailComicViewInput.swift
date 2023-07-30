//
//  DetailComicViewInput.swift
//  MyComics
//
//  Created by Andrey Piskunov on 17.07.2023.
//

import Foundation

protocol DetailComicViewInput: AnyObject {
    func updateView(model: DetailComicModel)
}
