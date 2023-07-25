//
//  DetailComicModuleBuilder.swift
//  MyComics
//
//  Created by Andrey Piskunov on 17.07.2023.
//

import UIKit

final class DetailComicModuleBuilder {
    
    static func build(id: Int) -> UIViewController {
        let presenter = DetailComicPresenter(id: id)
        let vc = DetailComicViewController(presenter: presenter)
        presenter.view = vc
        return vc
    }
}
