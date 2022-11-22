//
//  UIFont+Extension.swift
//  EarthValley80
//
//  Created by SHIN YOON AH on 2022/10/25.
//

import SwiftUI
import UIKit

enum FontName: String {
    case regular = "Happiness-Sans-Regular"
    case bold = "Happiness-Sans-Bold"
    case title = "Happiness-Sans-Title"
}

extension UIFont {
    static func font(_ style: FontName, ofSize size: CGFloat) -> UIFont {
        return UIFont(name: style.rawValue, size: size)!
    }
}

extension Font {
    static func happinessFont(_ style: FontName, ofSize size: CGFloat) -> Font {
        return .custom(style.rawValue, size: size)
    }
}
