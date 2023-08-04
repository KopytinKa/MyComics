//
//  NetworkService + Error.swift
//  MyComics
//
//  Created by Антон Сивцов on 29.06.2023.
//

import Foundation

extension NetworkService {
    enum NetworkError: Error {
        case baseError
        
        var description: String {
            switch self {
            case .baseError:
                return "base method makeRequest failed with error: \(self.localizedDescription)"
            }
        }
    }
}
