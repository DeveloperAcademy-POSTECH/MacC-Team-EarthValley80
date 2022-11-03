//
//  SwiftUI+Extension.swift
//  EarthValley80
//
//  Created by seojeon22 on 2022/10/27.
//

import SwiftUI

extension View {
    var getSafeAreaBottom: CGFloat {
        return UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 10
    }
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let red = Double((rgb >> 16) & 0xFF) / 255.0
        let green = Double((rgb >>  8) & 0xFF) / 255.0
        let blue = Double((rgb >>  0) & 0xFF) / 255.0
        self.init(red: red, green: green, blue: blue)
    }
    static let sidemenuColor = Color(hex: "#ECECEC")
}
