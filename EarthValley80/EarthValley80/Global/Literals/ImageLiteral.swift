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
    static var icXmark: UIImage { .load(systemName: "xmark") }
    static var icoNews: UIImage { .load(name: "ico_news")}
    
    // MARK: - image
    
    static var imgCoach: UIImage { .load(name: "img_coach") }
    static var imgCoach1: UIImage { .load(name: "img_coach1") }
    static var imgCoach2: UIImage { .load(name: "img_coach2") }
    
    // MARK: - button
    
    static var btnHome: UIImage { .load(name: "btn_home") }
    
    // MARK: - background
    
    static var cardSicL3: UIImage { .load(name: "card_sic_L3") }
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
