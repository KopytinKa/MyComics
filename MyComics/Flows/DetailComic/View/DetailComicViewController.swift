//
//  DetailComicViewController.swift
//  MyComics
//
//  Created by Andrey Piskunov on 17.07.2023.
//

import UIKit

final class DetailComicViewController: UIViewController {
    
    // MARK: - Properties
    
    private let presenter: DetailComicViewOutput
    
    private let comicImageView: AsyncImageView = {
        let comicImageView = AsyncImageView()
        comicImageView.contentMode = .scaleAspectFit
        return comicImageView
    }()
    
    private let comicTitleLabel: UILabel = {
        let comicTitleLabel = UILabel()
        comicTitleLabel.textColor = .white
        comicTitleLabel.font = .systemFont(ofSize: 23, weight: .bold)
        comicTitleLabel.textAlignment = .center
        comicTitleLabel.numberOfLines = 3
        return comicTitleLabel
    }()
    
    private let comicDescriptionLabel: UILabel = {
        let comicDescriptionLabel = UILabel()
        comicDescriptionLabel.textColor = .white
        comicDescriptionLabel.textAlignment = .center
        comicDescriptionLabel.font = .systemFont(ofSize: 17, weight: .light)
        comicDescriptionLabel.numberOfLines = 10
        return comicDescriptionLabel
    }()
    
    // MARK: - Init
    
    init(presenter: DetailComicViewOutput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        presenter.viewIsReady()
    }
    
    // MARK: - Private methods
    
    @objc func tapLikeNavBarButton() {
        print("tapLike")
    }
    
    private func configureUI() {
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: .likeBarButtonItem, style: .plain, target: self, action: #selector(tapLikeNavBarButton))
        navigationItem.rightBarButtonItem?.tintColor = .marvelRed
        view.backgroundColor = .commonBackground
        view.addSubview(comicImageView)
        view.addSubview(comicTitleLabel)
        view.addSubview(comicDescriptionLabel)
        setupConstraints()
    }
    
    private func setupConstraints() {
        let safeArea = self.view.safeAreaLayoutGuide
        
        comicImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            comicImageView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            comicImageView.leftAnchor.constraint(equalTo: view.leftAnchor),
            comicImageView.rightAnchor.constraint(equalTo: view.rightAnchor),
            comicImageView.heightAnchor.constraint(equalTo: comicImageView.widthAnchor)
        ])
        
        comicTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            comicTitleLabel.topAnchor.constraint(equalTo: comicImageView.bottomAnchor, constant: 20),
            comicTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            comicTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        comicDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            comicDescriptionLabel.topAnchor.constraint(equalTo: comicTitleLabel.bottomAnchor, constant: 20),
            comicDescriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            comicDescriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
}

// MARK: - DetailComicViewInput

extension DetailComicViewController: DetailComicViewInput {
    func updateView(model: DetailComicModel) {
        comicTitleLabel.text = model.title
        comicImageView.asyncImage = model.image
        comicDescriptionLabel.text = model.description
    }
}
