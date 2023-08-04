//
//  EmptyPlaceholderView.swift
//  MyComics
//
//  Created by Антон Сивцов on 16.07.2023.
//

import UIKit

final class EmptyPlaceholderView: UIView {
    
    private enum Constants {
        static let cornerInset: CGFloat = 20
        static let imageSize = CGSize(width: 50, height: 50)
    }
    
    // MARK: - Private Properties
    
    private let stackView = UIStackView()
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    
    // MARK: - Init
    
    init(model: Model) {
        super.init(frame: .zero)
        imageView.image = model.image
        titleLabel.text = model.title
        subtitleLabel.text = model.subtitle
        setupUI()
        setupConstraints()
    }
    
    @available (*, unavailable)
    required init?(coder: NSCoder) {
        assertionFailure("init(coder:) has not been implemented")
        return nil
    }
}

// MARK: - Private Methods

private extension EmptyPlaceholderView {
    func setupUI() {
        backgroundColor = .commonBackground
        addSubviews()
        setupStackView()
        setupImageView()
        setupTitleLabel()
        setupSubtitleLabel()
    }
    
    func addSubviews() {
        addSubview(stackView)
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(subtitleLabel)
    }
    
    func setupConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            stackView.leadingAnchor.constraint(
                lessThanOrEqualTo: self.leadingAnchor,
                constant: Constants.cornerInset
            ),
            stackView.trailingAnchor.constraint(
                lessThanOrEqualTo: self.trailingAnchor,
                constant: Constants.cornerInset
            )
        ])
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: Constants.imageSize.width),
            imageView.heightAnchor.constraint(equalToConstant: Constants.imageSize.height)
        ])
    }
    
    func setupStackView() {
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 10
    }
    
    func setupImageView() {
        imageView.tintColor = .systemGray
    }
    
    func setupTitleLabel() {
        titleLabel.font = .boldSystemFont(ofSize: 22)
    }
    
    func setupSubtitleLabel() {
        subtitleLabel.font = .italicSystemFont(ofSize: 15)
    }
}
