//
//  BestSellerCollectionView.swift
//  Ecommerce
//
//  Created by Rita on 02.02.2023.
//

import UIKit

struct BestSellerViewCellViewModel {
    let bestSellerViewModel: [BestSeller]
}

class BestSellerCollectionView: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    static let identifier = "BestSellerCollectionView"
    
    var bestSellerViewModel: [BestSeller] = []

    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 14
        layout.minimumInteritemSpacing = 8
        layout.sectionInset = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: layout)
        collectionView.register(BestSellerViewCell.self, forCellWithReuseIdentifier: BestSellerViewCell.identifier)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        collectionView.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        
        contentView.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
//        collectionView.frame = contentView.bounds
//        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
        collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
        collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
        collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
])


    }
    
    func configureebestSeller(with model: BestSellerViewCellViewModel) {
        bestSellerViewModel = model.bestSellerViewModel
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bestSellerViewModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BestSellerViewCell.identifier, for: indexPath) as! BestSellerViewCell
        cell.configure(with: bestSellerViewModel[indexPath.row], indexPath: indexPath)
//        cell.backgroundColor = .white
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width / 2 - 7 - 14
        return CGSize(width: width , height: 230)
    }
}
