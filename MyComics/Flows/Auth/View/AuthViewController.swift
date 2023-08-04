//
//  AuthViewController.swift
//  MyComics
//
//  Created by Кирилл Копытин on 23.07.2023.
//

import UIKit

final class AuthViewController: UIViewController {
    
    // MARK: - Properties
    
    private let contentView = AuthContentView()
    private let presenter: AuthViewOutput

    // MARK: - Init
    
    init(presenter: AuthViewOutput) {
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

// MARK: - AuthViewInput -

extension AuthViewController: AuthViewInput {
    func showAlert(with message: String) {
        showError(message: message)
    }
    
    func configure(isLogin: Bool) {
        contentView.configure(isLogin: isLogin)
    }
}

// MARK: - AuthContentViewDelegate -

extension AuthViewController: AuthContentViewDelegate {
    func enterButtonPressed(name: String?, email: String?, password: String?) {
        presenter.enterButtonPressed(name: name, email: email, password: password)
    }
    
    func switchLoginButtonPressed() {
        presenter.switchLoginButtonPressed()
    }
    
}
