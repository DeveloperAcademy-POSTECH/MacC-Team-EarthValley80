//
//  CGPoint+Extension.swift
//  EarthValley80
//
//  Created by LeeJiSoo on 2022/12/11.
//

import UIKit

extension CGPoint {
    func distance(from point: CGPoint) -> CGFloat {
        return hypot(point.x - self.x, point.y - self.y)
    }
}
