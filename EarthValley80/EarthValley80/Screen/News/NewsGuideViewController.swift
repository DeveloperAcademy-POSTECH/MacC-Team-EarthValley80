//
//  NewsGuideViewController.swift
//  EarthValley80
//
//  Created by SHIN YOON AH on 2022/10/26.
//

import UIKit

final class NewsGuideViewController: UIViewController {
    
    // MARK: - property

    private let titleView: CapsuleFormTitleView = CapsuleFormTitleView(title: StringLiteral.guidingTitle)

    // MARK: - init

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        self.setupUserDefaultValue()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupLayout()
        self.configureUI()
        self.setupTapGesture()
    }
    
    // MARK: - func

    private func setupUserDefaultValue() {
        UserDefaultHandler.setIsSeenGuide(to: true)
    }

    private func setupLayout() {
        self.view.addSubview(self.titleView)
        self.titleView.constraint(top: self.view.topAnchor,
                                  centerX: self.view.centerXAnchor,
                                  padding: UIEdgeInsets(top: 432.adjustedHeight, left: 0, bottom: 0, right: 0))
    }

    private func configureUI() {
        // TODO: - 컬러셋 정해지면 변경
        self.view.backgroundColor = .black.withAlphaComponent(0.94)
    }
    
    private func setupTapGesture() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.didTappedView(_:)))
        self.view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    // MARK: - selector
    
    @objc
    private func didTappedView(_ gestureRecognizer: UITapGestureRecognizer) {
        self.dismiss(animated: true)
    }
}
