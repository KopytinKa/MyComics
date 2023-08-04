//
//  UIViewController+Extension.swift
//  MyComics
//
//  Created by Кирилл Копытин on 28.06.2023.
//

import UIKit

extension UIViewController {
    
    func showError(title: String = LocalizationKeys.localized(.errorAlertTitle), message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: LocalizationKeys.localized(.alertCancelAction), style: .cancel, handler: nil)
        alert.addAction(action)
        
        present(alert, animated: true)
    }
}
