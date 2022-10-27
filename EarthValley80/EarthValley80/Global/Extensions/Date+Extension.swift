//
//  Date+Extension.swift
//  EarthValley80
//
//  Created by LeeJiSoo on 2022/10/27.
//

import UIKit

extension Date {
    public func dateFormatted(_ format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.locale = Locale(identifier: "UTC")
        return formatter.string(from: self).uppercased()
    }
}
