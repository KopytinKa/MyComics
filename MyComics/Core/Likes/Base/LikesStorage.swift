//
//  LikesStorage.swift
//  MyComics
//
//  Created by Антон Сивцов on 30.07.2023.
//

import Foundation

class LikesStorage: LikesManager, LikesInfoProvider {
    // MARK: - Private Properties
    
    private let userProvider: UserIDProvidable
    private let userDefaults = UserDefaults.standard
    
    private var storedLikes: [String: Int] = [:]
    
    private var specificationKey: String?
    
    private var specifiedStorageKey: String? {
        guard let userID = userProvider.getCurentUserID(),
              let specificationKey else { return nil }
        let key = userID + specificationKey
        return key
    }
    
    func setSpecificationKey(_ key: String) {
        self.specificationKey = key
    }
    
    // MARK: - Init
    
    init(userProvider: UserIDProvidable) {
        self.userProvider = userProvider
    }
    
    // MARK: - LikesManager
    
    func saveLike(_ id: Int) {
         if isLiked(id) == true {
            self.removeLike(id)
        } else {
            guard let key = getKey(id) else { return }
            userDefaults.set(id, forKey: key)
        }

        updateStorage(id: id)
    }
    
    // MARK: - LikesInfoProvider
    
    func isLiked(_ id: Int?) -> Bool {
        guard let key = getKey(id) else { return false }
        return userDefaults.string(forKey: key) != nil
    }
    
    private func getKey(_ id: Int?) -> String? {
        guard let id,
              let userID = userProvider.getCurentUserID(),
              let specificationKey else { return nil }
        
        return userID + specificationKey + "\(id)"
    }
    
    private func removeLike(_ id: Int) {
        guard let key = getKey(id) else { return }
        userDefaults.set(nil, forKey: key)
    }
    
    final func updateStorage(id: Int) {
        guard let specifiedStorageKey else { return }
        guard var likes = userDefaults.dictionary(forKey: specifiedStorageKey) as? [String: Int] else {
            let dictionary: [String: Int] = [:]
            userDefaults.set(dictionary, forKey: specifiedStorageKey)
            return
        }
        
        if likes[specifiedStorageKey + "\(id)"] != nil {
            likes[specifiedStorageKey + "\(id)"] = nil
        } else {
            likes[specifiedStorageKey + "\(id)"] = id
        }
        
        userDefaults.set(likes, forKey: specifiedStorageKey)
    }
}
