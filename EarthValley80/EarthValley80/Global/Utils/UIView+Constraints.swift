//
//  UIView+Constraints.swift
//  EarthValley80
//
//  Created by SHIN YOON AH on 2022/10/17.
//

import UIKit

enum ConstraintType {
    case top, leading, trailing, bottom, centerX, centerY
}

extension UIView {
    enum Frame {
        case widthAnchor
        case heightAnchor
    }
    
    func constraint(_ anchor: Frame, constant: CGFloat) {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        switch anchor {
        case .widthAnchor:
            self.widthAnchor.constraint(equalToConstant: constant).isActive = true
        case .heightAnchor:
            self.heightAnchor.constraint(equalToConstant: constant).isActive = true
        }
    }
    
    func constraint(to view: UIView, insets: UIEdgeInsets = .zero) {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let top = NSLayoutConstraint(item: self,
                                     attribute: .top,
                                     relatedBy: .equal,
                                     toItem: view,
                                     attribute: .top,
                                     multiplier: 1,
                                     constant: insets.top)
        
        let bottom = NSLayoutConstraint(item: self,
                                        attribute: .bottom,
                                        relatedBy: .equal,
                                        toItem: view,
                                        attribute: .bottom,
                                        multiplier: 1,
                                        constant: insets.bottom)
        
        let leading = NSLayoutConstraint(item: self,
                                         attribute: .leading,
                                         relatedBy: .equal,
                                         toItem: view,
                                         attribute: .leading,
                                         multiplier: 1,
                                         constant: insets.left)
        
        let trailing = NSLayoutConstraint(item: self,
                                          attribute: .trailing,
                                          relatedBy: .equal,
                                          toItem: view,
                                          attribute: .trailing,
                                          multiplier: 1,
                                          constant: insets.right)
        NSLayoutConstraint.activate([
            top, bottom, leading, trailing
        ])
    }
    
    @discardableResult
    func constraint(top: NSLayoutYAxisAnchor? = nil,
                    leading: NSLayoutXAxisAnchor? = nil,
                    bottom: NSLayoutYAxisAnchor? = nil,
                    trailing: NSLayoutXAxisAnchor? = nil,
                    centerX: NSLayoutXAxisAnchor? = nil,
                    centerY: NSLayoutYAxisAnchor? = nil,
                    padding: UIEdgeInsets = .zero) -> [ConstraintType: NSLayoutConstraint] {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        var constraints: [ConstraintType: NSLayoutConstraint] = [:]
        
        if let top = top {
            constraints[.top] = topAnchor.constraint(equalTo: top, constant: padding.top)
        }
        
        if let leading = leading {
            constraints[.leading] = leadingAnchor.constraint(equalTo: leading, constant: padding.left)
        }
        
        if let bottom = bottom {
            constraints[.bottom] = bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom)
        }
        
        if let trailing = trailing {
            constraints[.trailing] = trailingAnchor.constraint(equalTo: trailing, constant: -padding.right)
        }
        
        if let centerX = centerX {
            constraints[.centerX] = centerXAnchor.constraint(equalTo: centerX)
        }
        
        if let centerY = centerY {
            constraints[.centerY] = centerYAnchor.constraint(equalTo: centerY)
        }
        
        let constraintsArray: [NSLayoutConstraint] = Array(constraints.values)
        NSLayoutConstraint.activate(constraintsArray)
        return constraints
    }
}
