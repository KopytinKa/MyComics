//
//  UIView + Extensions.swift
//  MyComics
//
//  Created by Антон Сивцов on 02.07.2023.
//

import UIKit

extension UIView {
    static var identifier: String {
        String(describing: self)
    }
    
    static var screenScaleFactor: CGFloat {
        let maketWidth: CGFloat = 393
        let screenWidth = UIScreen.main.bounds.width
        let scalingFactor = screenWidth / maketWidth
        return scalingFactor
    }
}
