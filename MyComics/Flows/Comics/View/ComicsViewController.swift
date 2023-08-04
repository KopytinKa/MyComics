//
//  ComicsViewController.swift
//  MyComics
//
//  Created by Кирилл Копытин on 28.06.2023.
//

import UIKit

final class ComicsViewController: UIViewController {
    
    // MARK: - Properties
    
    private var presenter: ComicsViewOutput
    private let contentView = ComicsContentView()
    private let searchController = UISearchController()

    // MARK: - Init
    
    init(presenter: ComicsViewOutput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupActions()
    }
    
    override func loadView() {
        view = contentView
    }
}

// MARK: - ComicsViewInput

extension ComicsViewController: ComicsViewInput {
    func update(models: [ComicsContentView.Model]) {
        contentView.update(models: models)
        contentView.comicsData = contentView.convertData(models: models)
        contentView.reloadData()
    }
    
    func showAlert(with message: String) {
        showError(message: message)
    }
}

// MARK: - Private methods

private extension ComicsViewController {
    func setupUI() {
        presenter.viewIsReady()
        navigationItem.title = LocalizationKeys.localized(.comicsTabItem)
        view.backgroundColor = .commonBackground
        navigationItem.searchController = searchController
    }
    
    func setupActions() {
        contentView.setOnCellTapAction { [unowned self] indexPath in
            presenter.didTapCell(indexPath)
        }
    }
}
