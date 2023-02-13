//
//  MainCoordinator.swift
//  Ecommerce
//
//  Created by Rita on 11.02.2023.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    var tabBarController: TabBarController?
    
    func eventOccured(with type: Event) {
        switch type {
        case .buttonTapped:
            var vc: UIViewController & Coordinating = SheetViewController()
            vc.coordinator = self
            tabBarController?.present(vc, animated: true)
            return
        }
    }
    
    func start() -> UIViewController {
        //var vc: UIViewController & Coordinating = MainViewController()
        //vc.coordinator = self
        //tabBarController?.setViewControllers([vc], animated: false)
        tabBarController = TabBarController()
        tabBarController?.coordinator = self
        
        return tabBarController ?? TabBarController()
    }
}
