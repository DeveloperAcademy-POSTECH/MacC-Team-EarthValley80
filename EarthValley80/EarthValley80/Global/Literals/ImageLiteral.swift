//
//  ImageLiteral.swift
//  EarthValley80
//
//  Created by SHIN YOON AH on 2022/10/17.
//

import UIKit

enum ImageLiteral {
    
    // MARK: - icon
    
    static var icArrowRight: UIImage { .load(systemName: "arrow.right") }
    static var icArrowLeft: UIImage { .load(systemName: "arrow.left") }
    static var icChevronLeft: UIImage { .load(systemName: "chevron.left") }
    static var icXmark: UIImage { .load(systemName: "xmark") }
    static var icoNews: UIImage { .load(name: "ico_news")}
    static var icoCheck: UIImage { .load(systemName: "checkmark.seal.fill")}

    // MARK: - category

    static var society: UIImage { .load(name: "society")}
    static var world: UIImage { .load(name: "world")}
    static var history: UIImage { .load(name: "history")}
    static var robot: UIImage { .load(name: "robot")}
    static var environment: UIImage { .load(name: "environment")}
    static var health: UIImage { .load(name: "health")}
    static var animal: UIImage { .load(name: "animal")}
    static var space: UIImage { .load(name: "space")}
    static var science: UIImage { .load(name: "science")}
    static var company: UIImage { .load(name: "company")}
    static var money: UIImage { .load(name: "money")}
    static var economyIT: UIImage { .load(name: "it")}
    static var economy: UIImage { .load(name: "economy")}
    static var art: UIImage { .load(name: "art")}
    static var broadcast: UIImage { .load(name: "broadcast")}
    static var exercise: UIImage { .load(name: "exercise")}
    static var culture: UIImage { .load(name: "culture")}
}

extension UIImage {
    static func load(name: String) -> UIImage {
        guard let image = UIImage(named: name, in: nil, compatibleWith: nil) else {
            return UIImage()
        }
        image.accessibilityIdentifier = name
        return image
    }
    
    static func load(systemName: String) -> UIImage {
        guard let image = UIImage(systemName: systemName, compatibleWith: nil) else {
            return UIImage()
        }
        image.accessibilityIdentifier = systemName
        return image
    }
    
    func resize(to size: CGSize) -> UIImage {
        let image = UIGraphicsImageRenderer(size: size).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
        return image
    }
}
