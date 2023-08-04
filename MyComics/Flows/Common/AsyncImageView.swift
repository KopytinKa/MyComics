//
//  AsyncImageView.swift
//  MyComics
//
//  Created by Антон Сивцов on 02.07.2023.
//

import UIKit

final class AsyncImageView: UIImageView {
    
    // MARK: - Private Properties
    
    private var _asyncImage: AsyncImage?
    private let imageLoader = ImageLoader.shared
    
    // MARK: - Public Properties
    
    var asyncImage: AsyncImage? {
        get {
            return _asyncImage
        } set {
            if let newValue {
                self.image = .characterPlaceholder
                _asyncImage = newValue
                loadImage()
            } else {
                self.image = imageLoader.getChachedImage(by: _asyncImage?.id ?? .init()) ?? .characterPlaceholder
            }
        }
    }
    
    // MARK: - Private Methods
    
    private func loadImage() {
        guard let asyncImage = _asyncImage else { return }
        imageLoader.loadImage(asyncImage: asyncImage) { [weak self] image in
            DispatchQueue.main.async {
                self?.image = image
            }
        }
    }
}
