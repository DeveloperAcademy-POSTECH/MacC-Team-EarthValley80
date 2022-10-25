//
//  UIFont+Extension.swift
//  EarthValley80
//
//  Created by SHIN YOON AH on 2022/10/25.
//

import UIKit

enum FontName: String {
    case regular = "AppleSDGothicNeo-Regular"
    case medium = "AppleSDGothicNeo-Medium"
    case semibold = "AppleSDGothicNeo-SemiBold"
    case bold = "AppleSDGothicNeo-Bold"
}

extension UIFont {
    static func font(_ style: FontName, ofSize size: CGFloat) -> UIFont {
        return UIFont(name: style.rawValue, size: size)!
    }
}
