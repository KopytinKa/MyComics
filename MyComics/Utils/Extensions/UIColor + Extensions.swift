//
//  UIColor + Extensions.swift
//  MyComics
//
//  Created by Антон Сивцов on 02.07.2023.
//

import UIKit

extension UIColor {
    static let buttonBackground: UIColor? = checkedColor(name: "button_background_gray_color")
    static let cellBackground: UIColor? = checkedColor(name: "cell_background")
    static let commonBackground: UIColor? = checkedColor(name: "common_background")
    static let navigationBarGray: UIColor? = checkedColor(name: "navigation_bar_gray")
    static let marvelRed: UIColor? = checkedColor(name: "marvelRed")
    
    private static func checkedColor(name: String) -> UIColor? {
        guard let color = UIColor(named: name) else {
            assertionFailure("Color name chaneged or color has been deleted")
            return nil
        }
        return color
    }
}
