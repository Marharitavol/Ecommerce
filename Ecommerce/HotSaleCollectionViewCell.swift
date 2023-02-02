//
//  HotSaleCollectionViewCell.swift
//  Ecommerce
//
//  Created by Rita on 29.01.2023.
//

import UIKit

class HotSaleCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "HotSaleCollectionViewCell"
    
    var title: UILabel = {
        let title = UILabel()
        title.textColor = .white
        title.textAlignment = .left
        title.font = .systemFont(ofSize: 25, weight: .semibold)
        return title
    }()
    
    let subtitle: UILabel = {
        let subtitle = UILabel()
        subtitle.textColor = .white
        subtitle.textAlignment = .left
        subtitle.font = .systemFont(ofSize: 11, weight: .regular)
        return subtitle
    }()
    
    let picture: UIImageView = {
        let picture = UIImageView()
        picture.layer.cornerRadius = 10
        picture.clipsToBounds = true
        return picture
    }()
    
    let button: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 5
        button.setTitle("Buy now!", for: .normal)
        button.tintColor = UIColor.labelMain
        button.backgroundColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 11, weight: .semibold)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        
        addSubview(picture)
        picture.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            picture.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            picture.heightAnchor.constraint(equalToConstant: 185),
            picture.topAnchor.constraint(equalTo: contentView.topAnchor),
            picture.widthAnchor.constraint(equalToConstant: contentView.bounds.width - 25),
        ])
        
        addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            title.heightAnchor.constraint(equalToConstant: 30),
            title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 68)
        ])
        
        addSubview(subtitle)
        subtitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            subtitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            subtitle.heightAnchor.constraint(equalToConstant: 13),
            subtitle.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 5)
        ])
        
        addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            button.heightAnchor.constraint(equalToConstant: 23),
            button.widthAnchor.constraint(equalToConstant: 98),
            button.topAnchor.constraint(equalTo: subtitle.bottomAnchor, constant: 26)
        ])
    }
    
    func configure(with model: HomeStore, indexPath: IndexPath) {
        picture.downloaded(from: model.picture, contentMode: .scaleAspectFill)
        if indexPath.row == 1 {
            title.text = ""
        } else {
            title.text = model.title
        }
        subtitle.text = model.subtitle
    }
}
