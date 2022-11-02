//
//  NewsGuideViewController.swift
//  EarthValley80
//
//  Created by SHIN YOON AH on 2022/10/26.
//

import UIKit

final class NewsGuideViewController: UIViewController {
    
    private enum Size {
        static let buttonSize: CGFloat = 60.0
    }
    
    // MARK: - property
    
    private lazy var xmarkButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(ImageLiteral.icXmark, for: .normal)
        button.setPreferredSymbolConfiguration(.init(pointSize: 24, weight: .regular, scale: .large), forImageIn: .normal)
        button.tintColor = .evyWhite.withAlphaComponent(0.4)
        
        let action = UIAction { [weak self] _ in
            self?.dismiss(animated: true)
        }
        button.addAction(action, for: .touchUpInside)
        return button
    }()
    private let scrollGuidingView = GuidingView(guidingType: .scrollGuide)
    private let touchGuidingView = GuidingView(guidingType: .touchGuide)
    private let vocabularyGuidingView = GuidingView(guidingType: .vocabularyGuide)
    private let completeGuidingView = GuidingView(guidingType: .complete)
    
    // MARK: - life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupBlurEffect()
        self.setupLayout()
    }
    
    // MARK: - func
    
    private func setupBlurEffect() {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.systemUltraThinMaterialDark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.view.addSubview(blurEffectView)
    }
    
    private func setupLayout() {
        let guidingViews: [UIView] = [scrollGuidingView, touchGuidingView, vocabularyGuidingView, completeGuidingView]
        guidingViews.forEach {
            self.view.addSubview($0)
            $0.constraint(to: self.view)
        }
        
        self.view.addSubview(xmarkButton)
        self.xmarkButton.constraint(bottom: self.view.bottomAnchor,
                                    centerX: self.view.centerXAnchor,
                                    padding: UIEdgeInsets(top: 0, left: 0, bottom: 50, right: 0))
        self.xmarkButton.constraint(.heightAnchor, constant: Size.buttonSize)
        self.xmarkButton.constraint(.widthAnchor, constant: Size.buttonSize)
    }
}
