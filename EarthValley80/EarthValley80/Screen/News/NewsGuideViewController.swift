//
//  NewsGuideViewController.swift
//  EarthValley80
//
//  Created by SHIN YOON AH on 2022/10/26.
//

import UIKit

final class NewsGuideViewController: UIViewController {
    
    // MARK: - property

    
    // MARK: - life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - func

    private func setupLayout() {

    }
    
    private func setupUserDefaultValue() {
        UserDefaultHandler.setIsSeenGuide(to: true)
    }
    
    private func setupTapGesture() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.didTappedView(_:)))
        self.view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    // MARK: - selector
    
    @objc
    private func didTappedView(_ gestureRecognizer: UITapGestureRecognizer) {

    }
}
