//
//  String+Localizable.swift
//  MyComics
//
//  Created by Кирилл Копытин on 28.06.2023.
//

import Foundation
import CryptoKit

extension String {
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
    
    func MD5() -> String {
        guard let data = self.data(using: .utf8) else { return "" }
        let computed = Insecure.MD5.hash(data: data)
        return computed.map { String(format: "%02hhx", $0) }.joined()
    }
}
