//
//  DetailComicModuleBuilder.swift
//  MyComics
//
//  Created by Andrey Piskunov on 17.07.2023.
//

import UIKit

final class DetailComicModuleBuilder {
    
    static func build(comicID: Int) -> UIViewController {
        let apiService = APIBuilder.shared.makeComicsAPI()
        let presenter = DetailComicPresenter(id: comicID, comicAPIService: apiService)
        let vc = DetailComicViewController(presenter: presenter)
        presenter.view = vc
        return vc
    }
}
