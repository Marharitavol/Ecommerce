//
//  ViewController.swift
//  Ecommerce
//
//  Created by Rita on 25.01.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        return table
    }()
    
    private let dataFetcherService = DataFetcherService()
    var mainVCInfo = [HotSalesTableViewCellViewModel]()
    
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
  
    }
    
    @objc func addTapped() {
        print("tap")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    func fetchData() {
        dataFetcherService.fetchData { answer in
            guard let answer = answer else { return }
            let hotSalesModel = HotSalesTableViewCellViewModel(saleViewModels: answer.home_store)
            
            self.mainVCInfo = [hotSalesModel]
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return viewModels.count
        } else if section == 2 {
            return mainVCInfo.count
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
        } else
//        if indexPath.section == 2
        {
            let model = mainVCInfo[indexPath.row]
            
            guard let cell = tableView.dequeueReusableCell( withIdentifier: HotSalesCollectionView.identifier,
                for: indexPath) as? HotSalesCollectionView else { return UITableViewCell() }
            cell.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
            cell.configuree(with: model)
            return cell
        }
    }
    

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 95
        } else if indexPath.section == 1 {
            return 35
        } else {
            return 185
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        if section == 0 {
            let view = HeaderView(title: "Select Category", buttonTitle: "view all")
            return view
        } else if section == 2 {
            let view = HeaderView(title: "Hot Sales", buttonTitle: "see more")
            return view
        } else  {
            return nil
        }
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 70
        case 2:
            return 49
        default:
            return 0
        }
    }
}

