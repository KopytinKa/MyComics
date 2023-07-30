//
//  ComicsCollectionViewCell.swift
//  MyComics
//
//  Created by Алексей Артамонов on 13.07.2023.
//

import UIKit

final class ComicsCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Private properties
    
    var imageView = AsyncImageView()
    var titleLabel = UILabel()
    var authorLabel = UILabel()
    private var gradientView = UIView()
    private var likeButton = UIButton()
    private var identifier = "ComicsCollectionViewCell"
    var data: [Model] = []
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        titleLabel.text = ""
        authorLabel.text = ""
    }
}

// MARK: - Private extension

private extension ComicsCollectionViewCell {
    func setupUI() {
        contentView.backgroundColor = .cellBackground
        contentView.layer.cornerRadius = 10
        addSubviews()
        setupImageView()
        setupLikeButton()
        setupTitleLabel()
        setupAuthorLabel()
        setupGradientView()
    }
    
    func addSubviews() {
        contentView.addSubview(imageView)
        contentView.addSubview(gradientView)
        contentView.addSubview(likeButton)
        contentView.addSubview(titleLabel)
        contentView.addSubview(authorLabel)
        
        gradientView.layer.addSublayer(makeGradient())
    }
    
    func setupConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leftAnchor.constraint(equalTo: leftAnchor),
            imageView.rightAnchor.constraint(equalTo: rightAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        gradientView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            gradientView.topAnchor.constraint(equalTo: topAnchor),
            gradientView.leftAnchor.constraint(equalTo: leftAnchor),
            gradientView.rightAnchor.constraint(equalTo: rightAnchor),
            gradientView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            likeButton.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            likeButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            likeButton.widthAnchor.constraint(equalToConstant: 40),
            likeButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.bottomAnchor.constraint(lessThanOrEqualTo: imageView.bottomAnchor, constant: -20),
            titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10)
        ])
    }
    
    func setupImageView() {
        imageView.contentMode = .scaleAspectFill
    }
    
    func setupGradientView() {
        gradientView.frame = contentView.bounds
    }
    
    func setupLikeButton() {
        likeButton.setImage(.likeButton, for: .normal)
    }
    
    func setupTitleLabel() {
        titleLabel.textAlignment = .center
        titleLabel.textColor = .white
        titleLabel.font = .systemFont(ofSize: 16, weight: .heavy)
        titleLabel.numberOfLines = 3
    }
    
    func setupAuthorLabel() {
        authorLabel.textAlignment = .center
        authorLabel.textColor = .marvelRed
        authorLabel.font = .systemFont(ofSize: 14)
        authorLabel.numberOfLines = 1
    }
    
    func makeGradient() -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()

        gradientView.frame = contentView.frame
        gradientLayer.colors = [UIColor.white.cgColor.alpha,
                                UIColor.gray.cgColor.alpha,
                                UIColor.black.withAlphaComponent(0.9).cgColor]
        gradientLayer.frame.size = gradientView.frame.size

        return gradientLayer
    }
}

// MARK: - Public extension

extension ComicsCollectionViewCell {
    func configureCell(model: [Model], indexPath: IndexPath) {
        imageView.asyncImage = model[indexPath.row].image
        titleLabel.text = model[indexPath.row].title
        authorLabel.text = model[indexPath.row].author
    }
}
