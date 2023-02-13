//
//  Coordinator.swift
//  Ecommerce
//
//  Created by Rita on 11.02.2023.
//

import Foundation
import UIKit

enum Event {
    case buttonTapped
}

protocol Coordinator {
    var tabBarController: TabBarController? { get set }
    
    func eventOccured(with type: Event)
    func start() -> UIViewController
}

protocol Coordinating {
    var coordinator: Coordinator? { get set }
}
