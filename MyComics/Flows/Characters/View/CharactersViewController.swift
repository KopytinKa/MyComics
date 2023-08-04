//
//  CharactersViewController.swift
//  MyComics
//
//  Created by Кирилл Копытин on 28.06.2023.
//

import UIKit

final class CharactersViewController: UIViewController {
    
    // MARK: - Properties
    
    private let contentView = CharactersContentView()
    private let searchController = CharactersSearchController(searchResultsController: nil)
    private let presenter: CharactersViewOutput

    // MARK: - Init
    
    init(presenter: CharactersViewOutput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    @available (*, unavailable)
    required init?(coder: NSCoder) {
        assertionFailure("init(coder:) has not been implemented")
        return nil
    }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = LocalizationKeys.localized(.charactersTabItem)
        navigationItem.searchController = searchController
        searchController.customSearchDelegate = self
        navigationItem.hidesSearchBarWhenScrolling = false
        presenter.viewIsReady()
        setupActions()
    }
}

// MARK: - Private Methods -

private extension CharactersViewController {
    func setupActions() {
        contentView.setOnNextPageAction { [unowned self] in
            presenter.loadNextPage()
        }
        
        contentView.setOnCellTapAction { [unowned self] indexPath in
            presenter.didTapCell(indexPath)
        }
        
        contentView.setOnLikeTapAction { [unowned self] indexPath in
            presenter.didTapLike(indexPath)
        }
    }
}

// MARK: - CharactersViewInput -

extension CharactersViewController: CharactersViewInput {
    func update(models: [CharactersContentView.Model]) {
        contentView.update(models: models)
    }
    
    func showEmptySearchPlaceholder() {
        contentView.showEmptySearchPlaceholder()
    }
    
    func removeEmptySearchPlaceholder() {
        contentView.removeEmptySearchPlaceholder()
    }
}

extension CharactersViewController: CharactersSearchControllerDelegate {
    func textDidChange(_ text: String) {
        presenter.searchTextDidChange(text)
    }
    
    func cancelButtonClicked() {
        presenter.cancelButtonClicked()
    }
}
