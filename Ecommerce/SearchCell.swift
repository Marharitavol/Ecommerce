//
//  SearchCell.swift
//  Ecommerce
//
//  Created by Rita on 28.01.2023.
//

import Foundation
import UIKit

class SearchCell: UITableViewCell {

    static let identifier = "SearchCell"
    
    let searchBar: UISearchTextField = {
        let searchBar = UISearchTextField()
        searchBar.backgroundColor = .white
        searchBar.placeholder = "Search"
        return searchBar
    }()
    
    let qrButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 34 / 2
        button.setImage(UIImage(named: "QR"), for: .normal)
        button.tintColor = UIColor.white
        button.backgroundColor = UIColor.orangeMain
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        qrButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(qrButton)
        NSLayoutConstraint.activate([
            qrButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -27),
            qrButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            qrButton.heightAnchor.constraint(equalToConstant: 34),
            qrButton.widthAnchor.constraint(equalToConstant: 34)
        ])
        
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(searchBar)
        NSLayoutConstraint.activate([
            searchBar.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            searchBar.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 17),
            searchBar.trailingAnchor.constraint(equalTo: qrButton.leadingAnchor, constant: -11),
            searchBar.heightAnchor.constraint(equalToConstant: 34)
        ])
    }
}
