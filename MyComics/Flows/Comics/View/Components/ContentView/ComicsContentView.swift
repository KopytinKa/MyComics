//
//  ComicsContentView.swift
//  MyComics
//
//  Created by Алексей Артамонов on 13.07.2023.
//

import UIKit

final class ComicsContentView: UICollectionView {
    
    var comicsData: [ComicsCollectionViewCell.Model] = []
    var didSelectAction: ((IndexPath) -> Void)?
    
    // MARK: - init
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: .zero,
                   collectionViewLayout: Self.makeFlowLayout())
        
        self.register(ComicsCollectionViewCell.self,
                      forCellWithReuseIdentifier: ComicsCollectionViewCell.identifier)
        
        delegate = self
        dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ComicsContentView {
    static func makeFlowLayout() -> UICollectionViewFlowLayout {
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = .vertical
        
        return collectionViewLayout
    }
    
    func update(models: [ComicsContentView.Model]) {
        let models: [ComicsCollectionViewCell.Model] = models.map {
            .init(title: $0.title,
                  author: $0.author,
                  image: $0.image)
        }
        
    }
    
    func convertData(models: [ComicsContentView.Model]) -> [ComicsCollectionViewCell.Model] {
        return models.map {
            .init(title: $0.title,
                  author: $0.author,
                  image: $0.image)
        }
    }
}
