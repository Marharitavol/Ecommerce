//
//  TabBarController.swift
//  Ecommerce
//
//  Created by Rita on 05.02.2023.
//

import Foundation
import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateTabBar()
        setTabBarAppearance()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    private func generateTabBar() {
        viewControllers = [
            generateVCTextItem(viewController: MainViewController(), title: "Explorer"),
            generateVC(viewController: CartViewController(), image: UIImage(systemName: "cart")),
            generateVC(viewController: FavoriteViewController(), image: UIImage(systemName: "heart")),
            generateVC(viewController: MainViewController(), image: UIImage(systemName: "person"))
        ]
    }
    
    private func generateVCTextItem(viewController: UIViewController, title: String) -> UINavigationController {
        let item = UITabBarItem(title: title, image: nil, tag: 0)
        item.titlePositionAdjustment = .init(horizontal: 25, vertical: -17)
        let navVC = setupNavigationController(viewController: viewController, item: item)
        return navVC
    }
    
    private func generateVC(viewController: UIViewController, image: UIImage?) -> UINavigationController {
        let item = UITabBarItem(title: nil, image: image?.withAlignmentRectInsets(.init(top: 0, left: 0, bottom: 0, right: 0)), tag: 0)
        let navVC = setupNavigationController(viewController: viewController, item: item)
        return navVC
    }
    
    private func setupNavigationController(viewController: UIViewController, item: UITabBarItem) -> UINavigationController {
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem = item
        navController.navigationBar.scrollEdgeAppearance = navController.navigationBar.standardAppearance
        navController.navigationBar.setBackgroundImage(UIImage(), for: .default)
        
        return navController
    }
    
    private func setTabBarAppearance() {
        tabBar.backgroundImage = UIImage()
        tabBar.shadowImage = UIImage()
        tabBar.itemSpacing = 20
        
        let positionOnX: CGFloat = 1
        let positionOnY: CGFloat = 15
        let width = tabBar.bounds.width - positionOnX * 2
        let height: CGFloat = 72
        
        let roundLayer = CAShapeLayer()
        
        let bezierPath = UIBezierPath(roundedRect: CGRect(x: positionOnX, y: tabBar.bounds.minY - positionOnY, width: width, height: height), cornerRadius: 30)
        
        roundLayer.path = bezierPath.cgPath
        tabBar.layer.insertSublayer(roundLayer, at: 0)
        
        tabBar.itemWidth = width / 5
        tabBar.itemPositioning = .fill
        
        roundLayer.fillColor = UIColor.labelMain.cgColor
        tabBar.tintColor = .orangeMain
        tabBar.barTintColor = .white
    }
}
