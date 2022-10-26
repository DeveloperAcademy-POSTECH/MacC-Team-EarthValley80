//
//  UIColor+Extension.swift
//  EarthValley80
//
//  Created by SHIN YOON AH on 2022/10/17.
//

import UIKit

extension UIColor {
    static var evyBlack1: UIColor {
        return UIColor(hex: "#1B1B1B")
    }
    
    static var evyBlack2: UIColor {
        return UIColor(hex: "#6A6A6A")
    }
    
    static var evyGray1: UIColor {
        return UIColor(hex: "#A6A6A6")
    }
    
    static var evyGray2: UIColor {
        return UIColor(hex: "#E8E8E8")
    }
    
    static var evyGray3: UIColor {
        return UIColor(hex: "#ECECEC")
    }
    
    static var evyWhite: UIColor {
        return UIColor(hex: "#FFFFFF")
    }
}

extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexFormatted: String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
        
        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }
        
        assert(hexFormatted.count == 6, "Invalid hex code used.")
        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)
        
        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgbValue & 0x0000FF) / 255.0, alpha: alpha)
    }
}
