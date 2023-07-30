//
//  UserAuthStorage.swift
//  MyComics
//
//  Created by Антон Сивцов on 30.07.2023.
//

import Foundation

final class UserAuthStorage: UserIDStoragable, UserIDProvidable {
    
    // MARK: - Static
    
    static let shared = UserAuthStorage()
    
    // MARK: - Private Properties
    
    private let userDefaults = UserDefaults.standard
    private let keyPrefix = "user_key"
    private var currenID: String = ""
    
    // MARK: - Init
    
    private init() {}
    
    // MARK: - UserIDStoragable
    
    func saveUser(_ id: String) {
        guard getKey(for: id) == nil else {
            currenID = id
            return }
        userDefaults.set(id, forKey: id + keyPrefix)
        currenID = id
    }
    
    // MARK: - UserIDProvidable
    
    func getCurentUserID() -> String? {
        userDefaults.string(forKey: currenID + keyPrefix)
    }
    
    // MARK: - Private Methods
    
    private func getKey(for id: String) -> String? {
        userDefaults.string(forKey: id + keyPrefix)
    }
}
