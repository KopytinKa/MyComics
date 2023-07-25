import UIKit

final class ComicsScreenCoordinator: DetailSupportableCoordinator {
    
    // MARK: - Dependencies
    
    private let navigationController: UINavigationController?
    
    // MARK: - Init
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    // MARK: - CharactersCoordinator
    
    func openDetailScreen(id: Int) {
        let viewController = DetailComicModuleBuilder.build(id: id)
        navigationController?.pushViewController(viewController, animated: true)
    }
}
