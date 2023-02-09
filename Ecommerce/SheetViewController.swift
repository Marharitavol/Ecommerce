//
//  SheetViewController.swift
//  Ecommerce
//
//  Created by Rita on 07.02.2023.
//

import Foundation
import UIKit

class SheetViewController: UIViewController, UISheetPresentationControllerDelegate {
    
    lazy var stackView = UIStackView(arrangedSubviews: [brandSection, priceSection, sizeSection])
    let brandSection = FilterView(optionTitle: "Brand", title: "Samsung")
    let priceSection = FilterView(optionTitle: "Price", title: "$300 - $500")
    let sizeSection = FilterView(optionTitle: "Size", title: "4.5 to 5.5 inches")
    
    private let filterOptionslabel: UILabel = {
        let label = UILabel()
        label.text = "Filter options"
        label.textColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1)
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18, weight: .medium)
        return label
    }()
    
    let doneButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 10
        button.setTitle("Done", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.tintColor = UIColor.white
        button.backgroundColor = UIColor.orangeMain
        return button
    }()
    
    let closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 10
        button.setImage(UIImage(named: "close"), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.tintColor = UIColor.white
        button.backgroundColor = UIColor.labelMain
        return button
    }()
    
    override var sheetPresentationController: UISheetPresentationController {
        presentationController as! UISheetPresentationController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        closeButton.addTarget(self, action: #selector(dissmissScreen), for: .touchUpInside)
        setupSheetPresentation()
        setupLayout()
        configureStackView()
    }
    
    @objc func dissmissScreen() {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func setupSheetPresentation() {
        sheetPresentationController.delegate = self
        sheetPresentationController.selectedDetentIdentifier = .medium
        sheetPresentationController.detents = [
            .medium()]
    }
    
    func configureStackView() {
        setStackViewConstraints()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
    }
    
    func setStackViewConstraints() {
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: closeButton.bottomAnchor, constant: 40),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 230)
        ])
    }
    
    func setupLayout() {
        view.addSubview(closeButton)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            closeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 44),
            closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 24),
            closeButton.heightAnchor.constraint(equalToConstant: 37),
            closeButton.widthAnchor.constraint(equalToConstant: 37)
        ])
        
        view.addSubview(filterOptionslabel)
        filterOptionslabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            filterOptionslabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            filterOptionslabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 31),
            filterOptionslabel.heightAnchor.constraint(equalToConstant: 23)
        ])
        
        view.addSubview(doneButton)
        doneButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            doneButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            doneButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 24),
            doneButton.heightAnchor.constraint(equalToConstant: 37),
            doneButton.widthAnchor.constraint(equalToConstant: 86)
        ])
    }
}
