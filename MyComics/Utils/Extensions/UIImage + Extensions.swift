//
//  UIImage + Extensions.swift
//  MyComics
//
//  Created by Антон Сивцов on 02.07.2023.
//

import UIKit

extension UIImage {
    static let fillHeart: UIImage? = UIImage(systemName: "heart.circle.fill")
    static let emptyHeart: UIImage? = UIImage(systemName: "heart.circle")
    static let characterPlaceholder: UIImage? = checkedImage(name: "placeholder_image")
    static let searchImage: UIImage? = UIImage(systemName: "magnifyingglass")
    static let likeBarButtonItem: UIImage? = UIImage(systemName: "heart")
    
    private static func checkedImage(name: String) -> UIImage? {
        guard let image = UIImage(named: name) else {
            assertionFailure("Image name chaneged or image has been deleted")
            return nil
        }
        return image
    }
}
