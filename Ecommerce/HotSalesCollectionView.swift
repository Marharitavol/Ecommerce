//
//  HotSalesCollectionView.swift
//  Ecommerce
//
//  Created by Rita on 29.01.2023.
//

import UIKit

struct HotSalesTableViewCellViewModel {
    let saleViewModels: [HomeStore]
}

class HotSalesCollectionView: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    static let identifier = "HotSalesCollectionView"
    
    private var saleViewModels: [HomeStore] = []

    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 2, right: 0)
//        layout.minimumLineSpacing = 15
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: layout)
        collectionView.register(HotSaleCollectionViewCell.self, forCellWithReuseIdentifier: HotSaleCollectionViewCell.identifier)
        collectionView.showsHorizontalScrollIndicator = false
//        collectionView.contentInset.left = 15
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
        collectionView.frame = contentView.bounds
    }
    
    func configuree(with model: HotSalesTableViewCellViewModel) {
        saleViewModels = model.saleViewModels
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return saleViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HotSaleCollectionViewCell.identifier, for: indexPath) as! HotSaleCollectionViewCell
        cell.configure(with: saleViewModels[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: contentView.bounds.width, height: contentView.bounds.height)
    }
    
}
