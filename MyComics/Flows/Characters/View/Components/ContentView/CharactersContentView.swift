//
//  CharactersContentView.swift
//  MyComics
//
//  Created by Антон Сивцов on 02.07.2023.
//

import UIKit

typealias EmptyClosure = () -> Void
typealias IndexPathClosure = (IndexPath) -> Void

final class CharactersContentView: UICollectionView {
    
    private enum Section {
        case main
    }
    
    private typealias DataSourceType = UICollectionViewDiffableDataSource<Section, CharactersCollectionViewCell.Model>
    
    // MARK: - Private Properties
    
    private lazy var emptySearchPlaceholderView = EmptyPlaceholderView(
        model: .init(
            image: .searchImage,
            title: "There no characters found",
            subtitle: "Check you search text or try again"
        )
    )
    
    private lazy var diffableDataSource: DataSourceType = makeDiffableDataSource()
    private var loadNextPageAction: EmptyClosure?
    private var didTapLike: IndexPathClosure?
    private var didTapCell: IndexPathClosure?
    
    // MARK: - Init

    init() {
        super.init(frame: .zero, collectionViewLayout: Self.makeLayout())
        setupUI()
    }
    
    @available (*, unavailable)
    required init?(coder: NSCoder) {
        assertionFailure("init(coder:) has not been implemented")
        return nil
    }
    
    func update(models: [CharactersContentView.Model]) {
        let models: [CharactersCollectionViewCell.Model] = models.map {
            .init(title: $0.title, image: .init($0.image), isLiked: $0.isLiked)
        }
        var snapshot = NSDiffableDataSourceSnapshot<Section, CharactersCollectionViewCell.Model>()
        snapshot.appendSections([.main])
        snapshot.appendItems(models, toSection: .main)
        diffableDataSource.apply(snapshot, animatingDifferences: false)
        invalidateIntrinsicContentSize()
    }
    
    func setOnNextPageAction(_ action: @escaping EmptyClosure) {
        loadNextPageAction = action
    }
    
    func setOnLikeTapAction(_ action: @escaping IndexPathClosure) {
        didTapLike = action
    }
    
    func setOnCellTapAction(_ action: @escaping IndexPathClosure) {
        didTapCell = action
    }
    
    func showEmptySearchPlaceholder() {
        emptySearchPlaceholderView.isHidden = false
        emptySearchPlaceholderView.frame = self.frame
        isScrollEnabled = false
    }
    
    func removeEmptySearchPlaceholder() {
        emptySearchPlaceholderView.isHidden = true
        isScrollEnabled = true
    }
}

// MARK: - Private Methods

private extension CharactersContentView {
    func setupUI() {
        delegate = self
        backgroundColor = .commonBackground
        register(CharactersCollectionViewCell.self, forCellWithReuseIdentifier: CharactersCollectionViewCell.identifier)
        register(
            LoadingFooterView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
            withReuseIdentifier: LoadingFooterView.identifier
        )
        addSubview(emptySearchPlaceholderView)
        emptySearchPlaceholderView.isHidden = true
    }

    private func makeDiffableDataSource() -> DataSourceType {
        let diffableDataSource = DataSourceType(collectionView: self) { collectionView, indexPath, model in
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: CharactersCollectionViewCell.identifier,
                for: indexPath
            ) as? CharactersCollectionViewCell else { return UICollectionViewCell() }
            
            cell.configure(model)
            cell.setLikeButtonAction { [weak self] in
                self?.didTapLike?(indexPath)
            }
            cell.sizeToFit()
            
            return cell
        }
        
        diffableDataSource.supplementaryViewProvider = { [weak self] collection, _, indexPath in
            guard let footerView = collection.dequeueReusableSupplementaryView(
                ofKind: UICollectionView.elementKindSectionFooter,
                withReuseIdentifier: LoadingFooterView.identifier,
                for: indexPath
            ) as? LoadingFooterView else { return nil }
            self?.loadNextPageAction?()
            return footerView
        }
        
        return diffableDataSource
    }
    
    static func makeLayout() -> UICollectionViewCompositionalLayout {
        // Item
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .absolute(162.roundedScale()),
            heightDimension: .absolute(237.roundedScale())
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // Group
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: itemSize.heightDimension
        )

        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitem: item,
            count: 2
        )
        
        group.interItemSpacing = .fixed(31)
        group.contentInsets = .init(top: 0, leading: 19, bottom: 0, trailing: 19)

        // Section
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 19
        section.contentInsets = .init(top: 19, leading: 0, bottom: 19, trailing: 0)
        
        let footerView = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)),
            elementKind: UICollectionView.elementKindSectionFooter,
            alignment: .bottom
        )
        
        section.boundarySupplementaryItems = [footerView]

        // Layout
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}

// MARK: - UICollectionViewDelegate -

extension CharactersContentView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        didTapCell?(indexPath)
    }
}
