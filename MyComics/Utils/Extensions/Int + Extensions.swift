//
//  UInt + Extensions.swift
//  MyComics
//
//  Created by Антон Сивцов on 02.07.2023.
//

import UIKit

extension Int {
    func roundedScale() -> CGFloat {
        (CGFloat(self) * UIView.screenScaleFactor).rounded()
    }
}
