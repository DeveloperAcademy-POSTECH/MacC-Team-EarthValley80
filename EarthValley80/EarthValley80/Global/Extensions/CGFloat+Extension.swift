//
//  CGFloat+Extension.swift
//  EarthValley80
//
//  Created by LeeJiSoo on 2022/12/12.
//

import UIKit

extension CGFloat {
    public static func random() -> CGFloat {
        return (CGFloat(arc4random()) / CGFloat(UInt32.max))
    }

    public static func random(min: CGFloat, max: CGFloat) -> CGFloat {
        return CGFloat.random() * (max - min) + min
    }
}
