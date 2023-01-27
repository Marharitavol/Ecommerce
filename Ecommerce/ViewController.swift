//
//  ViewController.swift
//  Ecommerce
//
//  Created by Rita on 25.01.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(CollectionTableViewCell.self, forCellReuseIdentifier: CollectionTableViewCell.identifier)
        return table
    }()
    
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
        view.addSubview(tableView)
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        tableView.separatorStyle = .none
        tableView.sectionHeaderTopPadding = .zero

        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "Filter"), style: .plain, target: self, action: #selector(addTapped))
        
        navigationItem.rightBarButtonItem?.tintColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = viewModels[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CollectionTableViewCell.identifier,
            for: indexPath) as? CollectionTableViewCell else { fatalError() }
        cell.configure(with: viewModel)
        return cell
    }
    
    @objc func addTapped() {
        print("tap")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 95
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = HeaderView(title: "Select Category", buttonTitle: "view all")
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 70
    }
}

