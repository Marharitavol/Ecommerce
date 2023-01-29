//
//  HeaderView.swift
//  Ecommerce
//
//  Created by Rita on 27.01.2023.
//

import UIKit

class HeaderView: UIView {
    
    let headerTitle: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.labelMain
        label.font = .systemFont(ofSize: 25, weight: .medium)
        return label
    }()
    
    let headerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(UIColor.orangeMain, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .medium)
        return button
    }()
    
    init(title: String, buttonTitle: String) {
        super.init(frame: .zero)
        setupLayout()
        headerTitle.text = title
        headerButton.setTitle(buttonTitle, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        addSubview(headerTitle)
        headerTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headerTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 17),
            headerTitle.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        
        addSubview(headerButton)
        headerButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headerButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -33),
            headerButton.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}
