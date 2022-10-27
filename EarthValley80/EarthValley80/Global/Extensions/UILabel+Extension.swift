//
//  UILabel+Extension.swift
//  EarthValley80
//
//  Created by SHIN YOON AH on 2022/10/25.
//

import UIKit

extension UILabel {
    func setLineSpacing(kernValue: Double = 0.0,
                        lineSpacing: CGFloat = 0.0,
                        lineHeightMultiple: CGFloat = 0.0) {
        guard let labelText = self.text else { return }
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        paragraphStyle.lineHeightMultiple = lineHeightMultiple
        
        let attributedString: NSMutableAttributedString
        if let labelattributedText = self.attributedText {
            attributedString = NSMutableAttributedString(attributedString: labelattributedText)
        } else {
            attributedString = NSMutableAttributedString(string: labelText)
        }
        
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle,
                                      value: paragraphStyle,
                                      range: NSMakeRange(0, attributedString.length))
        attributedString.addAttribute(NSAttributedString.Key.kern,
                                      value: kernValue,
                                      range: NSMakeRange(0, attributedString.length))
        
        self.attributedText = attributedString
    }
    
    func applyColor(to targetString: String, with color: UIColor) {
        if let labelText = self.text, labelText.count > 0 {
            let attributedString = NSMutableAttributedString(string: labelText)
            
            attributedString.addAttribute(.foregroundColor,
                                          value: color,
                                          range: (labelText as NSString).range(of: targetString))
            
            self.attributedText = attributedString
        }
    }
}
