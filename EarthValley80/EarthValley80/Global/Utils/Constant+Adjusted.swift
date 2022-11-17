//
//  CGFloat+Adjusted.swift
//  EarthValley80
//
//  Created by SHIN YOON AH on 2022/11/17.
//

import UIKit

extension CGFloat {
    var adjustedWidth: CGFloat {
        let ratio: CGFloat = UIScreen.main.bounds.width / 1194
        return self * ratio
    }

    var adjustedHeight: CGFloat {
        let ratio: CGFloat = UIScreen.main.bounds.height / 834
        return self * ratio
    }
}

extension Double {
    var adjustedWidth: CGFloat {
        let ratio: CGFloat = UIScreen.main.bounds.width / 1194
        return self * ratio
    }

    var adjustedHeight: CGFloat {
        let ratio: CGFloat = UIScreen.main.bounds.height / 834
        return self * ratio
    }
}
