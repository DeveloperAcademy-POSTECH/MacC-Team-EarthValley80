//
//  NSObject+Extension.swift
//  EarthValley80
//
//  Created by SHIN YOON AH on 2022/10/17.
//

import Foundation

extension NSObject {
    static var className: String {
        return String(describing: self)
    }
}
