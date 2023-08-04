//
//  ComicsContentView+DataSource.swift
//  MyComics
//
//  Created by Алексей Артамонов on 13.07.2023.
//

import UIKit

extension ComicsContentView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return comicsData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ComicsCollectionViewCell.identifier,
            for: indexPath) as? ComicsCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.configureCell(model: comicsData, indexPath: indexPath)
        cell.layer.cornerRadius = 10
        cell.layer.masksToBounds = true
        
        return cell
    }
}
