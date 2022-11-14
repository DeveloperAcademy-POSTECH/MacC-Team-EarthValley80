//
//  BackButton.swift
//  EarthValley80
//
//  Created by SHIN YOON AH on 2022/10/25.
//

import UIKit

final class BackButton: UIButton {

    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupLayout()
        self.configureUI()
        self.setupBackAction()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - func
    
    private func setupLayout() {
        self.constraint(.heightAnchor, constant: 44)
        self.constraint(.widthAnchor, constant: 107)
    }
    
    private func configureUI() {
        self.setImage(ImageLiteral.btnHome, for: .normal)
    }
    
    private func setupBackAction() {
        let backAction = UIAction { _ in
            guard let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else { return }
            sceneDelegate.navigateToNewsFeedViewController()
        }
        self.addAction(backAction, for: .touchUpInside)
    }
}
