//
//  CharactersSearchController.swift
//  MyComics
//
//  Created by Антон Сивцов on 16.07.2023.
//

import UIKit

final class CharactersSearchController: UISearchController {
    
    weak var customSearchDelegate: CharactersSearchControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
    }
}

extension CharactersSearchController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        customSearchDelegate?.textDidChange(searchText)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        customSearchDelegate?.cancelButtonClicked()
    }
}
