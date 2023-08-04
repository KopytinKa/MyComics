//
//  CharactersCollectionViewCell.swift
//  MyComics
//
//  Created by Антон Сивцов on 02.07.2023.
//

import UIKit

final class CharactersCollectionViewCell: UICollectionViewCell {
    
    private enum Constants {
        static let standardCornerInset: CGFloat = 10
    }
    
    // MARK: - Private Properties
    
    private let imageView = AsyncImageView()
    private let titleLabel = UILabel()
    private let gradientLayer = CAGradientLayer()
    private let likeButton = LikeButton()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    @available (*, unavailable)
    required init?(coder: NSCoder) {
        assertionFailure("init(coder:) has not been implemented")
        return nil
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = ""
    }
    
    // MARK: - Public Methods
    
    func configure(_ model: Model) {
        imageView.asyncImage = model.image
        titleLabel.text = model.title
        likeButton.updateState(model.isLiked)
    }
    
    func setLikeButtonAction(_ action: @escaping EmptyClosure) {
        likeButton.action = action
    }
}

// MARK: - Private Methods

private extension CharactersCollectionViewCell {
    func setupUI() {
        contentView.backgroundColor = .cellBackground
        contentView.layer.cornerRadius = 10
        addSubviews()
        setupImageView()
        setupTitleLabel()
        setupLikeButton()
        addBottomGradient()
    }
    
    func addSubviews() {
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(likeButton)
    }
    
    func setupConstraints() {
        // imageView
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leftAnchor.constraint(equalTo: leftAnchor),
            imageView.rightAnchor.constraint(equalTo: rightAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        // titleLabel
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.bottomAnchor.constraint(lessThanOrEqualTo: imageView.bottomAnchor, constant: -20),
            titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: Constants.standardCornerInset),
            titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -Constants.standardCornerInset)
        ])
        
        // detailStackView
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            likeButton.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            likeButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -10)
        ])
        
        self.subviews.forEach { subviews in
            subviews.constraints.forEach { $0.priority = .sceneSizeStayPut }
        }
    }
    
    func setupImageView() {
        imageView.layer.cornerRadius = 10
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.contentScaleFactor = 0.5
        imageView.setContentHuggingPriority(.required, for: .vertical)
        imageView.maximumContentSizeCategory = .small
    }
    
    func setupTitleLabel() {
        titleLabel.textColor = .white
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 2
        titleLabel.font = .boldSystemFont(ofSize: 20)
    }
    
    func setupLikeButton() {
        likeButton.setBackgroundImage(.fillHeart, for: .normal)
        likeButton.setTitleShadowColor(.black, for: .normal)
    }
    
    func addBottomGradient() {
        gradientLayer.colors = [UIColor.black.cgColor, UIColor.black.withAlphaComponent(0).cgColor]
        gradientLayer.startPoint = .init(x: 0.5, y: 1)
        gradientLayer.endPoint = .init(x: 0.5, y: 0.5)
        imageView.layer.addSublayer(gradientLayer)
        gradientLayer.frame = contentView.bounds
    }
}
