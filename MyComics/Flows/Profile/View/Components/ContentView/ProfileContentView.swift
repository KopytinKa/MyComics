//
//  ProfileContentView.swift
//  MyComics
//
//  Created by Кирилл Копытин on 23.07.2023.
//

import UIKit

private enum Constants {
        static let paddingS: CGFloat = 20
        static let paddingM: CGFloat = 40
        static let height: CGFloat = 44
        static let cornerRadius: CGFloat = 8
        static let avatarSize: CGFloat = 120
        static let usernameLabelSize: CGFloat = 24
}

final class ProfileContentView: UIView {
    // MARK: - Properties

     weak var delegate: ProfileContentViewDelegate?
    
    // MARK: - Subviews
    
    private lazy var userAvatar: UIImageView = {
        let userAvatar = UIImageView()
        userAvatar.translatesAutoresizingMaskIntoConstraints = false
        userAvatar.layer.masksToBounds = true
        userAvatar.layer.cornerRadius = Constants.avatarSize / 2
        return userAvatar
    }()
    
    private lazy var usernameLabel: UILabel = {
        let usernameLabel = UILabel()
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        usernameLabel.textColor = .white
        usernameLabel.numberOfLines = 1
        usernameLabel.font = .boldSystemFont(ofSize: Constants.usernameLabelSize)
        usernameLabel.textAlignment = .center
        return usernameLabel
    }()
    
    private lazy var formStack: UIStackView = {
        let formStack = UIStackView()
        formStack.translatesAutoresizingMaskIntoConstraints = false
        formStack.axis = .vertical
        formStack.backgroundColor = .black
        formStack.layer.masksToBounds = true
        formStack.layer.cornerRadius = Constants.cornerRadius
        return formStack
    }()
    
    private lazy var logoutButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(LocalizationKeys.localized(.logoutButton), for: .normal)
        button.setTitleColor(.systemRed, for: .normal)
        button.addTarget(self, action: #selector(logoutButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var favoriteCharactersButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(LocalizationKeys.localized(.favoriteCharactersButton), for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(favoriteCharactersButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var readComicsButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(LocalizationKeys.localized(.readComicsButton), for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(readComicsButtonPressed), for: .touchUpInside)
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
        addSubview(userAvatar)
        addSubview(usernameLabel)
        addSubview(formStack)
        
        formStack.addArrangedSubview(favoriteCharactersButton)
        formStack.addArrangedSubview(readComicsButton)
        formStack.addArrangedSubview(logoutButton)
    }
    
    private func setupConstraints() {
        let safeArea = safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            userAvatar.widthAnchor.constraint(equalToConstant: Constants.avatarSize),
            userAvatar.heightAnchor.constraint(equalToConstant: Constants.avatarSize),
            userAvatar.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            userAvatar.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: Constants.paddingS),
            
            usernameLabel.topAnchor.constraint(equalTo: userAvatar.bottomAnchor, constant: Constants.paddingS),
            usernameLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: Constants.paddingM),
            usernameLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -Constants.paddingM),
            usernameLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),

            formStack.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: Constants.paddingM),
            formStack.bottomAnchor.constraint(lessThanOrEqualTo: safeArea.bottomAnchor, constant: -Constants.paddingM),
            formStack.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: Constants.paddingS),
            formStack.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -Constants.paddingS),
            
            favoriteCharactersButton.heightAnchor.constraint(equalToConstant: Constants.height),
            
            readComicsButton.heightAnchor.constraint(equalToConstant: Constants.height),
            
            logoutButton.heightAnchor.constraint(equalToConstant: Constants.height)
        ])
    }
    
    func configure(model: UserModel) {
        usernameLabel.text = model.name
        userAvatar.image = UIImage(systemName: "person.circle.fill")
    }
    
    // MARK: - Action
    
    @objc func logoutButtonPressed(_ sender: UIButton) {
        delegate?.logoutButtonPressed()
    }
    
    @objc func favoriteCharactersButtonPressed(_ sender: UIButton) {
        delegate?.favoriteCharactersButtonPressed()
    }
    
    @objc func readComicsButtonPressed(_ sender: UIButton) {
        delegate?.readComicsButtonPressed()
    }
}
