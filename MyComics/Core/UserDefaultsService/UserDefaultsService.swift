//
//  UserDefaultsService.swift
//  MyComics
//
//  Created by Кирилл Копытин on 23.07.2023.
//

import Foundation

final class UserDefaultsService: UserDefaultsServiceProtocol {
    
    func set(key: String, value: Any?) {
        UserDefaults.standard.set(value, forKey: key)
    }
    
    func integer(key: String) -> Int {
        let value = UserDefaults.standard.integer(forKey: key)
        return value
    }
    
    func string(key: String) -> String {
        let value = UserDefaults.standard.string(forKey: key)
        return value ?? ""
    }
    
    func bool(key: String) -> Bool {
        let value = UserDefaults.standard.bool(forKey: key)
        return value
    }
    
    func remove(key: String) {
        UserDefaults.standard.removeObject(forKey: key)
    }
}
