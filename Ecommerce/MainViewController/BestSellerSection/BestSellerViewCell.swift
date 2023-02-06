//
//  BestSellerViewCell.swift
//  Ecommerce
//
//  Created by Rita on 02.02.2023.
//

import UIKit

class BestSellerViewCell: UICollectionViewCell {
    
    static let identifier = "BestSellerViewCell"
    
    var modelOfPhone: UILabel = {
        let modelOfPhone = UILabel()
        modelOfPhone.textColor = .labelMain
        modelOfPhone.textAlignment = .left
        modelOfPhone.font = .systemFont(ofSize: 10, weight: .regular)
        return modelOfPhone
    }()
    
    let price: UILabel = {
        let price = UILabel()
        price.textColor = .labelMain
        price.textAlignment = .left
        price.font = .systemFont(ofSize: 16, weight: .bold)
        return price
    }()
    
    let oldPrice: UILabel = {
        let price = UILabel()
        price.textColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1)
        price.textAlignment = .left
        price.font = .systemFont(ofSize: 10, weight: .regular)
        return price
    }()
    
    let picture: UIImageView = {
        let picture = UIImageView()
        picture.layer.cornerRadius = 10
        picture.clipsToBounds = true
        return picture
    }()
    
    let likeButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 25 / 2
        button.tintColor = .orangeMain
        button.backgroundColor = .white
        
        button.layer.shadowColor = UIColor.gray.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 3)
        button.layer.shadowRadius = 10
        button.layer.shadowOpacity = 0.4
        button.layer.shadowPath = nil
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 10
        contentView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        
        contentView.addSubview(picture)
        picture.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            picture.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            picture.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            picture.heightAnchor.constraint(equalToConstant: 168),
            picture.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            picture.widthAnchor.constraint(equalToConstant: 187)
        ])
        
        contentView.addSubview(price)
        price.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            price.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 21),
            price.heightAnchor.constraint(equalToConstant: 20),
            price.topAnchor.constraint(equalTo: picture.bottomAnchor, constant: 5)
        ])
        
        contentView.addSubview(oldPrice)
        oldPrice.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            oldPrice.leadingAnchor.constraint(equalTo: price.trailingAnchor, constant: 7),
            oldPrice.heightAnchor.constraint(equalToConstant: 13),
            oldPrice.topAnchor.constraint(equalTo: picture.bottomAnchor, constant: 10)
        ])
        
        contentView.addSubview(modelOfPhone)
        modelOfPhone.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            modelOfPhone.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 21),
            modelOfPhone.heightAnchor.constraint(equalToConstant: 13),
            modelOfPhone.topAnchor.constraint(equalTo: price.bottomAnchor, constant: 5)
        ])
        
        contentView.addSubview(likeButton)
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            likeButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            likeButton.heightAnchor.constraint(equalToConstant: 25),
            likeButton.widthAnchor.constraint(equalToConstant: 25),
            likeButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 11)
        ])
    }
    
    func configure(with model: BestSeller, indexPath: IndexPath) {
        
        modelOfPhone.text = model.title
        price.text = "$\(model.price_without_discount)"
        
        if indexPath.row == 2 {
            picture.image = UIImage(named: "SamsungS20")
        } else {
            picture.downloaded(from: model.picture, contentMode: .scaleAspectFill)
        }
        
        if model.is_favorites {
            likeButton.setImage(UIImage(named: "fullHeart"), for: .normal)
        } else {
            likeButton.setImage(UIImage(named: "emptyHeart"), for: .normal)
        }

        
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: "$\(model.discount_price)")
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
        oldPrice.attributedText = attributeString
    }
}
