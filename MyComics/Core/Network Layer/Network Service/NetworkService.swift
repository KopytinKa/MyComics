//
//  NetworkService.swift
//  Generic View Controller
//
//  Created by Антон Сивцов on 25.06.2023.
//

import Foundation

#warning("Setup your public key and delete the warning")
private let publicKey = ""
#warning("Setup your private key and delete the warning")
private let privateKey = ""
                                                                               
final class NetworkService {
    
    // MARK: - Private Properties
    
    private let session = URLSession.shared
    private var baseURLString: String {
        "https://gateway.marvel.com/v1/public/"
    }
    
    // MARK: - Public Methods
    
    func makeStandardRequest<T: EntityPresentable>(
        configuration: Configutation,
        completion: @escaping (EntityWrapper<T>) -> Void
    ) {
        #warning("Not in use currently")
        self.makeRequest(configuration: configuration) { result in
            switch result {
            case .success(let data):
                guard let data else { return }
                do {
                    let wrappedEntity = try JSONDecoder().decode(EntityWrapper<T>.self, from: data)
                    completion(wrappedEntity)
                } catch {
                    completion(.light())
                }
            case .failure(let error):
                dump(error)
                completion(.light())
            }
        }
    }
    
    func makeEntitiesRequest<T: EntityPresentable>(
        configuration: Configutation,
        parameters: [String: String]? = nil,
        completion: @escaping ([T]?) -> Void
    ) {
        self.makeRequest(configuration: configuration, parameters: parameters) { result in
            switch result {
            case .success(let data):
                guard let data else { return }
                do {
                    let wrappedEntity = try JSONDecoder().decode(EntityWrapper<T>.self, from: data)
                    completion(wrappedEntity.data?.results)
                } catch {
                    completion(nil)
                }
            case .failure(let error):
                dump(error)
                completion(nil)
            }
        }
    }
    
    func makeRequestWithParameters<T: EntityPresentable>(
        path: Path,
        _ parameters: RequestParameters,
        completion: @escaping ([T]?) -> Void
    ) {
        let mirror = Mirror(reflecting: parameters)
        
        var parametersDictionary: [String: String] = [:]
        
        mirror.children.forEach { child in
            if let label = child.label, let value = child.value as? String {
                parametersDictionary[label] = value
            }
        }
        
        makeEntitiesRequest(
            configuration: .init(initialPath: path),
            parameters: parametersDictionary,
            completion: completion
        )
    }
}

// MARK: - Private Methods -

private extension NetworkService {
    func makeRequest(
        configuration: Configutation,
        parameters: [String: String]? = nil,
        completion: @escaping (Result<Data?, Error>) -> Void
    ) {
        let ts = "\(1)"
        let authHash = "\(ts)\(privateKey)\(publicKey)".MD5()
        
        var urlComponents = URLComponents(
            base: baseURLString,
            path: configuration.initialPath,
            pathConfiguration: configuration.additionalPath
        )
        
        urlComponents?.queryItems = []
        
        if let parameters {
            parameters.forEach { key, value in
                let item = URLQueryItem(name: key, value: value)
                urlComponents?.queryItems?.append(item)
            }
        }
        
        urlComponents?.queryItems?.append(contentsOf: [
            URLQueryItem(name: "ts", value: ts),
            URLQueryItem(name: "apikey", value: publicKey),
            URLQueryItem(name: "hash", value: authHash)
        ])
        
        guard let url = urlComponents?.url else { return }
        
        let dataTask = session.dataTask(with: url) { data, _, error in
            if let error {
                completion(.failure(error))
                return
            }
            
            completion(.success(data))
        }
        
        dataTask.resume()
    }
}
