//
//  Model.swift
//  Ecommerce
//
//  Created by Rita on 28.01.2023.
//

import Foundation

struct ForMainVC: Decodable {
    let home_store: [HomeStore]
    let best_seller: [BestSeller]
}

struct HomeStore: Decodable {
    let id: Int
    let is_new: Bool?
    let title: String
    let subtitle: String
    let picture: String
}

struct BestSeller: Decodable {
    let id: Int
    let is_favorites: Bool
    let title: String
    let price_without_discount: Int
    let discount_price: Int
    let picture: String
}
