//
//  LoadingFooterView.swift
//  MyComics
//
//  Created by Антон Сивцов on 09.07.2023.
//

import UIKit

final class LoadingFooterView: UICollectionReusableView {
    
    // MARK: - Private Properties
    
    private let activityIndicatorIvew = UIActivityIndicatorView(style: .medium)
    
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
    
    func startRefreshing() {
        activityIndicatorIvew.startAnimating()
    }
    
    func stopRefreshing() {
        activityIndicatorIvew.stopAnimating()
    }
}

// MARK: - Private Methods -

private extension LoadingFooterView {
    func setupUI() {
        addSubviews()
        setupActivityIndicatorIvew()
    }
    
    func addSubviews() {
        addSubview(activityIndicatorIvew)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            activityIndicatorIvew.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            activityIndicatorIvew.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    func setupActivityIndicatorIvew() {
        activityIndicatorIvew.translatesAutoresizingMaskIntoConstraints = false
    }
}
