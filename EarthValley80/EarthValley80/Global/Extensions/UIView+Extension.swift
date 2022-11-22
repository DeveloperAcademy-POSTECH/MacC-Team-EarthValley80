//
//  UIView+Extension.swift
//  EarthValley80
//
//  Created by SHIN YOON AH on 2022/10/17.
//

import UIKit

extension UIView {
    @discardableResult
    func makeShadow(color: UIColor,
                    opacity: Float,
                    offset: CGSize,
                    radius: CGFloat) -> Self {
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offset
        layer.shadowRadius = radius
        return self
    }

    @discardableResult
    func makeButtonShadow(color: UIColor,
                          opacity: Float,
                          offset: CGSize,
                          radius: CGFloat,
                          buttonTitle: String,
                          buttonHeight: CGFloat) -> Self {
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offset
        layer.shadowRadius = radius
        let shadowWidth = self.calculateButtonWidth(with: buttonTitle) + 20
        layer.shadowPath = UIBezierPath(ovalIn: CGRect(origin: .zero, size: CGSize(width: shadowWidth, height: buttonHeight))).cgPath
        return self
    }

    private func calculateButtonWidth(with buttonTitle: String) -> CGFloat {
        let label = UILabel()
        label.text = buttonTitle
        label.font = .font(.bold, ofSize: 16)
        label.sizeToFit()
        return label.frame.width + 92
    }
}
