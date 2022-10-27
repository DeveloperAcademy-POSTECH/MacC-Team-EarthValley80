//
//  Date+Extension.swift
//  EarthValley80
//
//  Created by LeeJiSoo on 2022/10/27.
//

import UIKit

extension Date {
    /**
     # formatted
     - Parameters:
        - format: 변형할 DateFormat
     - Note: DateFormat으로 변형한 String 반환
    */
    public func dateFormatted(_ format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}
