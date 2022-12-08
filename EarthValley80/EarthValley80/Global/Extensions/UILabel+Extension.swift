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
        if let labelAttributedText = self.attributedText {
            attributedString = NSMutableAttributedString(attributedString: labelAttributedText)
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
    
    func applyFont(to targetString: String, with font: UIFont) {
        guard let labelText = self.text else { return }
        
        let attributedString: NSMutableAttributedString
        if let labelAttributedText = self.attributedText {
            attributedString = NSMutableAttributedString(attributedString: labelAttributedText)
        } else {
            attributedString = NSMutableAttributedString(string: labelText)
        }
        
        attributedString.addAttribute(NSAttributedString.Key.font,
                                      value: font,
                                      range: (labelText as NSString).range(of: targetString))
        
        self.attributedText = attributedString
    }

    func textIndex(at point: CGPoint) -> Int? {
        guard let attributedText = self.attributedText else { return nil }
        let layoutManager = NSLayoutManager()
        let textContainer = NSTextContainer(size: self.bounds.size)
        let textStorage = NSTextStorage(attributedString: attributedText)

        textContainer.lineFragmentPadding = 0.0
        layoutManager.addTextContainer(textContainer)
        textStorage.addLayoutManager(layoutManager)

        let range = layoutManager.glyphRange(for: textContainer)
        let textBounds = layoutManager.boundingRect(forGlyphRange: range,
                                                    in: textContainer)
        let paddingWidth = (self.bounds.size.width - textBounds.size.width) / 2
        var textOffset = CGPoint.zero

        if paddingWidth > 0 {
            textOffset.x = paddingWidth
        }

        let newPoint = CGPoint(x: point.x - textOffset.x,
                               y: point.y - textOffset.y)

        return layoutManager.glyphIndex(for: newPoint, in: textContainer)
    }
}
