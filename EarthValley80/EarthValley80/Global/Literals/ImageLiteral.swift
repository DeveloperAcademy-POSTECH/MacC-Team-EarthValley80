//
//  ImageLiteral.swift
//  EarthValley80
//
//  Created by SHIN YOON AH on 2022/10/17.
//

import SwiftUI
import UIKit

enum ImageLiteral {
    
    // MARK: - icon
    
    static var icArrowRight: UIImage { .load(systemName: "arrow.right") }
    static var icArrowLeft: UIImage { .load(systemName: "arrow.left") }
    static var icChevronLeft: UIImage { .load(systemName: "chevron.left") }
    static var icXmark: UIImage { .load(systemName: "xmark") }
    static var icSquareAndArrowUp: UIImage { .load(systemName: "square.and.arrow.up") }
    static var icoNews: UIImage { .load(name: "ico_news")}
    static var icoAngry: UIImage { .load(name: "ico_angry")}
    static var icoSurprised: UIImage { .load(name: "ico_excited")}
    static var icoFun: UIImage { .load(name: "ico_fun")}
    static var icoSad: UIImage { .load(name: "ico_sad")}
    static var icoScary: UIImage { .load(name: "ico_scary")}

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

    // MARK: - button

    static var btnAfterReaction: UIImage { .load(name: "btn_afterReaction")}
    static var btnBeforeReaction: UIImage { .load(name: "btn_beforeReaction")}
    static var btnMyMainSentence: UIImage { .load(name: "btn_myMainSentence")}

    // MARK: - image

    static var imgCongrate: UIImage { .load(name: "img_congrate")}
    static var imgEco1: UIImage { .load(name: "img_eco1")}
    static var imgEco2: UIImage { .load(name: "img_eco2")}
    static var imgMunhwa1: UIImage { .load(name: "img_munhwa1")}
    static var imgMunhwa2: UIImage { .load(name: "img_munhwa2")}
    static var imgSci1: UIImage { .load(name: "img_sci1")}
    static var imgSci2: UIImage { .load(name: "img_sci2")}
    static var imgSisa1: UIImage { .load(name: "img_sisa1")}
    static var imgSisa2: UIImage { .load(name: "img_sisa2")}
}

extension ImageLiteral {
    
    // MARK: - SwiftUI
    
    static var imgYomoJomoLogo: Image = Image("yomojomoLogo")
    static var imgGoToYomoRoomArrow: Image = Image(systemName: "arrowtriangle.right.fill")
    static var imgSideMenu1: String = "newspaper.fill"
    static var imgSideMenu2: String = "lasso.and.sparkles"
    static var imgSideMenu3: String = "doc.text.magnifyingglass"
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
