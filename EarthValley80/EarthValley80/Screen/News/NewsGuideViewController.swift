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
    
    private enum Step: Int, CaseIterable {
        case scroll = 0
        case touch = 1
        case vocabulary = 2
        case complete = 3
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
    
    private var step: Step = .scroll
    
    // MARK: - life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUserDefaultValue()
        self.setupBlurEffect()
        self.setupTapGesture()
        self.setupLayout()
        self.updateGuideStep(to: step)
    }
    
    // MARK: - func
    
    private func setupUserDefaultValue() {
        UserDefaultHandler.setIsSeenGuide(to: true)
    }
    
    private func setupBlurEffect() {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.systemUltraThinMaterialDark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.view.addSubview(blurEffectView)
    }
    
    private func setupTapGesture() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.didTappedView(_:)))
        self.view.addGestureRecognizer(tapGestureRecognizer)
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
    
    private func updateGuideStep(to step: Step) {
        self.scrollGuidingView.isHidden = (step != .scroll)
        self.touchGuidingView.isHidden = (step != .touch)
        self.vocabularyGuidingView.isHidden = (step != .vocabulary)
        self.completeGuidingView.isHidden = (step != .complete)
    }
    
    // MARK: - selector
    
    @objc
    private func didTappedView(_ gestureRecognizer: UITapGestureRecognizer) {
        guard
            let nextStep = Step(rawValue: self.step.rawValue + 1),
            nextStep.rawValue < Step.allCases.count
        else {
            self.dismiss(animated: true); return
        }
        
        self.step = nextStep
        self.updateGuideStep(to: nextStep)
    }
}
