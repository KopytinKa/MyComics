//
//  ComicsModuleBuilder.swift
//  MyComics
//
//  Created by Кирилл Копытин on 28.06.2023.
//

import UIKit

final class ComicsModuleBuilder {
    static func build(_ navigationController: UINavigationController?) -> UIViewController {
        let comicsAPI = APIBuilder.shared.makeComicsAPI()
        let dataAdapter = ComicsDataAdapter(comicsAPI: comicsAPI)
        let coordinator = ComicsScreenCoordinator(navigationController: navigationController)
        let presenter = ComicsPresenter(
            coordinator: coordinator, dataAdapter: dataAdapter
        )
        let comicsViewController = ComicsViewController(presenter: presenter)
        presenter.view = comicsViewController
        return comicsViewController
    }
}
