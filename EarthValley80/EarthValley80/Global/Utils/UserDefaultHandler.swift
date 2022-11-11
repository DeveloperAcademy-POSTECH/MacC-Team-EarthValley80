//
//  UserDefaultHandler.swift
//  EarthValley80
//
//  Created by SHIN YOON AH on 2022/11/04.
//

import Foundation

struct UserDefaultHandler {
    static func setIsSeenGuide(to isSeenGuide: Bool) {
        UserData.setValue(isSeenGuide, forKey: .isSeenGuide)
    }
}
