//
//  DatabaseService.swift
//  MyComics
//
//  Created by Кирилл Копытин on 23.07.2023.
//

import Foundation
import FirebaseDatabase

final class DatabaseService: DatabaseServiceProtocol {
    
    // MARK: - Properties

    weak var delegate: DatabaseServiceDelegate?
    
    // MARK: - Methods
    
    func saveUser(_ user: FirebaseUser) {
        let ref = Database.database().reference().child(FirebaseKeys.TablesNames.users)
        ref.child(user.id).updateChildValues([
            FirebaseKeys.UserKeys.name: user.name,
            FirebaseKeys.UserKeys.email: user.email
        ])
    }
    
    func getUser(by uid: String) {
        let ref = Database.database().reference().child(FirebaseKeys.TablesNames.users)
        ref.child(uid).getData { [weak self] error, result in
            if let error {
                self?.delegate?.showError(with: error.localizedDescription)
                return
            }
            
            if let result, let user = FirebaseUser(snapshot: result) {
                self?.delegate?.showData(user: user)
            }
        }
    }
}
