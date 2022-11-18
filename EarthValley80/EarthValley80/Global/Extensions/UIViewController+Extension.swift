//
//  UIViewController+Extension.swift
//  EarthValley80
//
//  Created by SHIN YOON AH on 2022/10/17.
//

import UIKit

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(endEditingView))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func endEditingView() {
        view.endEditing(true)
    }
}
