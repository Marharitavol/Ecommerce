//
//  ViewController.swift
//  Ecommerce
//
//  Created by Rita on 25.01.2023.
//

import UIKit

class MainViewController: UIViewController, Coordinating {
    var coordinator: Coordinator?
    
    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        return table
    }()
    
    private let dataFetcherService = DataFetcherService()
    var mainVCInfo = [HotSalesTableViewCellViewModel]()
    var bestSellerInfo = [BestSellerViewCellViewModel]()
    
    var sizeOfSection3 = Int()
    
    private let viewModels: [CollectionTableViewCellViewModel] = [
        CollectionTableViewCellViewModel(
            viewModels: [
                TileCollectionViewCellViewModel(name: "Phones", image: UIImage(named: "Phones")!),
                TileCollectionViewCellViewModel(name: "Computers", image: UIImage(named: "Computer")!),
                TileCollectionViewCellViewModel(name: "Health", image: UIImage(named: "Health")!),
                TileCollectionViewCellViewModel(name: "Books", image: UIImage(named: "Books")!),
                TileCollectionViewCellViewModel(name: "Phones", image: UIImage(named: "Phones")!),
                TileCollectionViewCellViewModel(name: "Computers", image: UIImage(named: "Computer")!)
            ]
        )
    ]
    
//    var calcHeight = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetchData()

        view.addSubview(tableView)
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        tableView.separatorStyle = .none
        tableView.sectionHeaderTopPadding = .zero

        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "Filter"), style: .plain, target: self, action: #selector(addTapped))
        
        navigationItem.rightBarButtonItem?.tintColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1)
        tableView.register(HotSalesCollectionView.self, forCellReuseIdentifier: HotSalesCollectionView.identifier)
        tableView.register(CollectionTableViewCell.self, forCellReuseIdentifier: CollectionTableViewCell.identifier)
        tableView.register(SearchCell.self, forCellReuseIdentifier: SearchCell.identifier)
        tableView.register(BestSellerCollectionView.self, forCellReuseIdentifier: BestSellerCollectionView.identifier)
  
    }
    
    @objc func addTapped() {
        coordinator?.eventOccured(with: .buttonTapped)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    func fetchData() {
        dataFetcherService.fetchData { answer in
            guard let answer = answer else { return }
            let hotSalesModel = HotSalesTableViewCellViewModel(saleViewModels: answer.home_store)
            let bestseller = BestSellerViewCellViewModel(bestSellerViewModel: answer.best_seller)
            self.mainVCInfo = [hotSalesModel]
            self.bestSellerInfo = [bestseller]
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return viewModels.count
        } else if section == 2 {
            return mainVCInfo.count
        } else if section == 3 {
            return bestSellerInfo.count
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let viewModel = viewModels[indexPath.row]
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: CollectionTableViewCell.identifier,
                for: indexPath) as? CollectionTableViewCell else { fatalError() }
            cell.configure(with: viewModel)
            return cell
            
        } else if indexPath.section == 1 {
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: SearchCell.identifier,
                for: indexPath) as? SearchCell else { fatalError() }
            cell.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
            return cell
            
        } else if indexPath.section == 2 {
            let model = mainVCInfo[indexPath.row]
            
            guard let cell = tableView.dequeueReusableCell( withIdentifier: HotSalesCollectionView.identifier,
                for: indexPath) as? HotSalesCollectionView else { return UITableViewCell() }
            cell.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
            cell.configuree(with: model)
            return cell
            
        } else {
            let model = bestSellerInfo[indexPath.row]
            guard let cell = tableView.dequeueReusableCell( withIdentifier: BestSellerCollectionView.identifier,
                for: indexPath) as? BestSellerCollectionView else { return UITableViewCell() }
            cell.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
            cell.configureebestSeller(with: model)
            sizeOfSection3 = cell.bestSellerViewModel.count
            return cell
        }
    }
    

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 95
        } else if indexPath.section == 1 {
            return 35
        } else if indexPath.section == 2 {
            return 185
        } else {
            let size = 185 * sizeOfSection3 / 2
            return CGFloat(size)
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        if section == 0 {
            let view = HeaderView(title: "Select Category", buttonTitle: "view all")
            return view
        } else if section == 2 {
            let view = HeaderView(title: "Hot Sales", buttonTitle: "see more")
            return view
        } else {
            let view = HeaderView(title: "Best Seller", buttonTitle: "see more")
            return view
        }
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 70
        case 2:
            return 49
        default:
            return 46
        }
    }
}
