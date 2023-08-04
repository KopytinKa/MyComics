//
//  AuthContentView.swift
//  MyComics
//
//  Created by Кирилл Копытин on 23.07.2023.
//

import UIKit

private enum Constants {
        static let paddingS: CGFloat = 20
        static let paddingM: CGFloat = 40
        static let height: CGFloat = 44
        static let width: CGFloat = 200
        static let cornerRadius: CGFloat = 8
        static let formStackSpacing: CGFloat = 16
}

final class AuthContentView: UIView {
    // MARK: - Properties

    weak var delegate: AuthContentViewDelegate?
    
    // MARK: - Subviews
    
    private lazy var formStack: UIStackView = {
        let formStack = UIStackView()
        formStack.translatesAutoresizingMaskIntoConstraints = false
        formStack.axis = .vertical
        formStack.spacing = Constants.formStackSpacing
        formStack.alignment = .center
        return formStack
    }()
    
    private lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = LocalizationKeys.localized(.enterName)
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.textContentType = .nickname
        textField.backgroundColor = .black
        textField.textAlignment = .center
        textField.layer.masksToBounds = true
        textField.layer.cornerRadius = Constants.cornerRadius
        return textField
    }()
    
    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = LocalizationKeys.localized(.enterEmail)
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.keyboardType = .emailAddress
        textField.textContentType = .emailAddress
        textField.backgroundColor = .black
        textField.textAlignment = .center
        textField.layer.masksToBounds = true
        textField.layer.cornerRadius = Constants.cornerRadius
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = LocalizationKeys.localized(.enterPassword)
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.isSecureTextEntry = true
        textField.textContentType = .password
        textField.backgroundColor = .black
        textField.textAlignment = .center
        textField.layer.masksToBounds = true
        textField.layer.cornerRadius = Constants.cornerRadius
        return textField
    }()
    
    private lazy var enterButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.layer.masksToBounds = true
        button.layer.cornerRadius = Constants.cornerRadius
        button.addTarget(self, action: #selector(enterButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let subtitleLabel = UILabel()
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.textColor = .white
        subtitleLabel.numberOfLines = 1
        subtitleLabel.textAlignment = .center
        return subtitleLabel
    }()
    
    private lazy var switchLoginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(switchLoginButtonPressed), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI
    
    private func configureUI() {
        backgroundColor = .commonBackground
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        addSubview(formStack)
        addSubview(enterButton)
        addSubview(subtitleLabel)
        addSubview(switchLoginButton)

        formStack.addArrangedSubview(nameTextField)
        formStack.addArrangedSubview(emailTextField)
        formStack.addArrangedSubview(passwordTextField)
    }
    
    private func setupConstraints() {
        let safeArea = safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            formStack.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: Constants.paddingS),
            formStack.bottomAnchor.constraint(equalTo: enterButton.topAnchor, constant: -Constants.paddingS),
            formStack.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            formStack.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            
            nameTextField.heightAnchor.constraint(equalToConstant: Constants.height),
            nameTextField.leadingAnchor.constraint(equalTo: formStack.leadingAnchor, constant: Constants.paddingM),
            nameTextField.trailingAnchor.constraint(equalTo: formStack.trailingAnchor, constant: -Constants.paddingM),
            
            emailTextField.heightAnchor.constraint(equalToConstant: Constants.height),
            emailTextField.leadingAnchor.constraint(equalTo: formStack.leadingAnchor, constant: Constants.paddingM),
            emailTextField.trailingAnchor.constraint(equalTo: formStack.trailingAnchor, constant: -Constants.paddingM),
            
            passwordTextField.heightAnchor.constraint(equalToConstant: Constants.height),
            passwordTextField.leadingAnchor.constraint(equalTo: formStack.leadingAnchor, constant: Constants.paddingM),
            passwordTextField.trailingAnchor.constraint(equalTo: formStack.trailingAnchor, constant: -Constants.paddingM),
            
            enterButton.bottomAnchor.constraint(equalTo: subtitleLabel.topAnchor, constant: -Constants.paddingS),
            enterButton.widthAnchor.constraint(equalToConstant: Constants.width),
            enterButton.heightAnchor.constraint(equalToConstant: Constants.height),
            enterButton.centerXAnchor.constraint(equalTo: formStack.centerXAnchor),
            
            subtitleLabel.bottomAnchor.constraint(equalTo: switchLoginButton.topAnchor),
            subtitleLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            subtitleLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            
            switchLoginButton.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -Constants.paddingS),
            switchLoginButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            switchLoginButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor)
        ])
    }
    
    func configure(isLogin: Bool) {
        nameTextField.isHidden = isLogin
        enterButton.setTitle(isLogin ? LocalizationKeys.localized(.loginButton) : LocalizationKeys.localized(.registerButton), for: .normal)
        switchLoginButton.setTitle(isLogin ? LocalizationKeys.localized(.registerButton) : LocalizationKeys.localized(.loginButton), for: .normal)
        subtitleLabel.text = isLogin ? LocalizationKeys.localized(.haveNotAccountLabel) : LocalizationKeys.localized(.haveAccountLabel)
    }
    
    // MARK: - Action
    
    @objc func enterButtonPressed(_ sender: UIButton) {
        delegate?.enterButtonPressed(
            name: nameTextField.text,
            email: emailTextField.text,
            password: passwordTextField.text
        )
    }
    
    @objc func switchLoginButtonPressed(_ sender: UIButton) {
        delegate?.switchLoginButtonPressed()
    }
}
