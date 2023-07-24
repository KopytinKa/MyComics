//
//  ComicsModuleBuilder.swift
//  MyComics
//
//  Created by Кирилл Копытин on 28.06.2023.
//

import UIKit

final class ComicsModuleBuilder {
    
    static func build() -> UIViewController {
        let requestConfigurator = APIRequestConfigurator<ComicEntity>(networkService: .init())
        let comicsAPI = ComicsAPIService(apiRequestConfigurator: requestConfigurator)
        let dataAdapter = ComicsDataAdapter(comicsAPI: comicsAPI)
        let presenter = ComicsPresenter(
            dataAdapter: dataAdapter
        )
        let comicsViewController = ComicsViewController(presenter: presenter)
        presenter.view = comicsViewController
        return comicsViewController
    }
}
