//
//  TileCollectionViewCell.swift
//  Ecommerce
//
//  Created by Rita on 25.01.2023.
//

import UIKit

struct TileCollectionViewCellViewModel {
    let name: String
    let image: UIImage
}

class TileCollectionViewCell: UICollectionViewCell {
    static let identifier = "TileCollectionViewCell"
    
    private let label: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1)
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 12, weight: .medium)
        return label
    }()
        
    private let iconsView: UIImageView = {
        let icons = UIImageView()
        icons.translatesAutoresizingMaskIntoConstraints = false
        icons.tintColor = UIColor(red: 0.702, green: 0.702, blue: 0.765, alpha: 1)
        return icons
    }()
    
    private let roundBackground: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 71 / 2
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(roundBackground)
        contentView.addSubview(iconsView)
        contentView.addSubview(label)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        roundBackground.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            roundBackground.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            roundBackground.topAnchor.constraint(equalTo: contentView.topAnchor),
            roundBackground.widthAnchor.constraint(equalToConstant: 71),
            roundBackground.heightAnchor.constraint(equalToConstant: 71)
        ])
        
        iconsView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            iconsView.centerXAnchor.constraint(equalTo: roundBackground.centerXAnchor),
            iconsView.centerYAnchor.constraint(equalTo: roundBackground.centerYAnchor)
        ])
        
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: roundBackground.centerXAnchor),
            label.topAnchor.constraint(equalTo: roundBackground.bottomAnchor, constant: 7)
        ])
    }
        
    func configure(with viewModel: TileCollectionViewCellViewModel) {
        label.text = viewModel.name
        iconsView.image = viewModel.image
    }
}
