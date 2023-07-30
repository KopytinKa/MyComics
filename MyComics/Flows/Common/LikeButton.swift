//
//  LikeButton.swift
//  MyComics
//
//  Created by Антон Сивцов on 30.07.2023.
//

import Foundation
import UIKit

final class LikeButton: UIButton {
    
    var action: EmptyClosure?
    
    // MARK: - Private Properties
    
    private var isSelectedState = false
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    @available (*, unavailable)
    required init?(coder: NSCoder) {
        assertionFailure("init(coder:) has not been implemented")
        return nil
    }
    
    func updateState(_ isSelected: Bool) {
        isSelectedState = isSelected
        toggleState()
    }
}

// MARK: - Private Methods

private extension LikeButton {
    func setupUI() {
        tintColor = .white
        backgroundColor = .commonBackground
        layer.cornerRadius = 30 / 2
        clipsToBounds = true
        setBackgroundImage(.emptyHeart, for: .normal)
        addTarget(self, action: #selector(didTapAction), for: .touchUpInside)
    }
    func setupConstraints() {
        // detailStackView
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: 30.roundedScale()),
            heightAnchor.constraint(equalToConstant: 30.roundedScale())
        ])
    }
    
    func toggleState() {
        if isSelectedState {
            tintColor = .marvelRed
            setBackgroundImage(.fillHeart, for: .normal)
        } else {
            tintColor = .white
            setBackgroundImage(.emptyHeart, for: .normal)
        }
    }
}

private extension LikeButton {
    @objc func didTapAction() {
        isSelectedState = !isSelectedState
        toggleState()
        action?()
    }
}
