//
//  FilterView.swift
//  Ecommerce
//
//  Created by Rita on 08.02.2023.
//

import UIKit

class FilterView: UIView {
    
    private let optionTitleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textColor = UIColor.labelMain
        titleLabel.textAlignment = .left
        titleLabel.font = .systemFont(ofSize: 18, weight: .regular)
        return titleLabel
    }()
    
    private let rectView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0.863, green: 0.863, blue: 0.863, alpha: 1).cgColor
        return view
    }()
    
    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textColor = UIColor.labelMain
        titleLabel.textAlignment = .left
        titleLabel.font = .systemFont(ofSize: 18, weight: .light)
        return titleLabel
    }()
    
    private let arrowButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Arrow"), for: .normal)
        button.tintColor = UIColor(red: 0.863, green: 0.863, blue: 0.863, alpha: 1)
        return button
    }()
    
    init(optionTitle: String, title: String) {
        super.init(frame: .zero)
        self.optionTitleLabel.text = optionTitle
        self.titleLabel.text = title
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        
        addSubview(optionTitleLabel)
        optionTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        optionTitleLabel.topAnchor.constraint(equalTo: topAnchor),
        optionTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 46),
//        optionTitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
        optionTitleLabel.heightAnchor.constraint(equalToConstant: 24)
        ])
        
        addSubview(rectView)
        rectView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rectView.centerXAnchor.constraint(equalTo: centerXAnchor),
            rectView.topAnchor.constraint(equalTo: optionTitleLabel.bottomAnchor, constant: 8),
            rectView.widthAnchor.constraint(equalToConstant: 337),
            rectView.heightAnchor.constraint(equalToConstant: 37)
        ])
        
        rectView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: rectView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: rectView.leadingAnchor, constant: 14)
        ])
        
        rectView.addSubview(arrowButton)
        arrowButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            arrowButton.centerYAnchor.constraint(equalTo: rectView.centerYAnchor),
            arrowButton.trailingAnchor.constraint(equalTo: rectView.trailingAnchor, constant: -20),
            arrowButton.widthAnchor.constraint(equalToConstant: 16),
            arrowButton.heightAnchor.constraint(equalToConstant: 8)
        ])
    }
}
