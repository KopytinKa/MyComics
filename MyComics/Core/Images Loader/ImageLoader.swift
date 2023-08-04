//
//  ImageLoader.swift
//  MyComics
//
//  Created by Антон Сивцов on 02.07.2023.
//

import Foundation
import UIKit

final class ImageLoader {
    
    // MARK: - ImageVariant
    
    enum ImageVariant: String {
        case portrait_small    // 50x75px
        case portrait_medium    // 100x150px
        case portrait_xlarge    // 150x225px
        case portrait_fantastic    // 168x252px
        case portrait_uncanny    // 300x450px
        case portrait_incredible    // 216x324px
    }
    
    // MARK: - Static Properites
    
    static let shared = ImageLoader()
    
    // MARK: - Private Properties
    
    private var session = URLSession.shared
    private let loadingQueue = DispatchQueue(label: #file, attributes: .concurrent)
    private var cach: [UUID: UIImage] = [:]
    
    // MARK: - Init
    
    private init() {}
    
    // MARK: - Public Method
    
    func getChachedImage(by id: UUID) -> UIImage? {
        return cach[id]
    }
    
    func loadImage(
        asyncImage: AsyncImage,
        variant: ImageVariant = .portrait_incredible,
        completion: @escaping (UIImage?) -> Void
    ) {
        if let image = cach[asyncImage.id] {
            completion(image)
            return
        }
        
        guard let urlString = asyncImage.imageURL,
              let urlExtension = asyncImage.imageExtension,
              let url = URL(string: "\(urlString)/\(variant.rawValue).\(urlExtension)") else {
            completion(.characterPlaceholder)
            return
        }
        
        let dataTask = session.dataTask(with: url) { [weak self] data, _, _ in
            guard let data = data else {
                completion(.characterPlaceholder)
                return
            }
            let image = UIImage(data: data)
            self?.cach[asyncImage.id] = image
            completion(image)
        }
        
        loadingQueue.async {
            dataTask.resume()
        }
    }
}
