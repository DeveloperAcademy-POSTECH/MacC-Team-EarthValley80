//
//  UITextView+Extension.swift
//  EarthValley80
//
//  Created by SHIN YOON AH on 2022/10/26.
//

import UIKit

extension UITextView {
    func setTypingAttributes(kernValue: Double = 0.0,
                        lineSpacing: CGFloat = 0.0,
                        lineHeightMultiple: CGFloat = 0.0) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        paragraphStyle.lineHeightMultiple = lineHeightMultiple
        
        let attributes: [NSAttributedString.Key: Any] = [.kern: -0.6,
                                                         .paragraphStyle: paragraphStyle]
        self.typingAttributes = attributes
    }
}
