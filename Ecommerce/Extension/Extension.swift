//
//  ExtensionForUIColor.swift
//  Ecommerce
//
//  Created by Rita on 28.01.2023.
//

import Foundation
import UIKit

extension UIColor {
    static let orangeMain = UIColor(red: 1, green: 0.429, blue: 0.304, alpha: 1)
    static let labelMain = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1)
}

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
