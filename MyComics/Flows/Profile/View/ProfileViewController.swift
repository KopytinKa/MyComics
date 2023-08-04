//
//  ProfileViewController.swift
//  MyComics
//
//  Created by Кирилл Копытин on 28.06.2023.
//

import UIKit

final class ProfileViewController: UIViewController {

    // MARK: - Properties
    
    private let contentView = ProfileContentView()
    private var presenter: ProfileViewOutput

    // MARK: - Init
    
    init(presenter: ProfileViewOutput) {
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
        contentView.delegate = self
        navigationItem.title = LocalizationKeys.localized(.profileTabItem)
        presenter.viewIsReady()
    }
    
}

// MARK: - ProfileViewInput

extension ProfileViewController: ProfileViewInput {
    func showAlert(with message: String) {
        showError(message: message)
    }
    
    func showData(_ data: UserModel) {
        contentView.configure(model: data)
    }
}

// MARK: - ProfileContentViewDelegate

extension ProfileViewController: ProfileContentViewDelegate {
    func logoutButtonPressed() {
        presenter.logoutButtonPressed()
    }
    
    func favoriteCharactersButtonPressed() {
        presenter.favoriteCharactersButtonPressed()
    }
    
    func readComicsButtonPressed() {
        presenter.readComicsButtonPressed()
    }
    
}
