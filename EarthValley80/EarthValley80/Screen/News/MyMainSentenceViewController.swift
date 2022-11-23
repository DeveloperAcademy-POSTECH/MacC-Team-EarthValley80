//
//  MyMainSentenceViewController.swift
//  EarthValley80
//
//  Created by SHIN YOON AH on 2022/11/20.
//

import UIKit

final class MyMainSentenceViewController: UIViewController {

    private enum Size {
        static let buttonSize: CGFloat = 69.0
    }

    // MARK: - property

    private let closeButton: UIButton = {
        let button = UIButton()

        // TODO: - 나중에 Asset 이미지 변경
        let imageView = UIImageView(image: UIImage(systemName: "xmark.circle"))
        imageView.tintColor = .evyWhite
        button.addSubview(imageView)
        imageView.constraint(top: button.topAnchor, centerX: button.centerXAnchor)
        imageView.constraint(.heightAnchor, constant: Size.buttonSize)
        imageView.constraint(.widthAnchor, constant: Size.buttonSize)

        return button
    }()
    private let mainSentenceView = MainSentenceView(type: .summary)

    // MARK: - life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupLayout()
        self.configureUI()
        self.setupButtonAction()
    }

    // MARK: - func

    private func setupLayout() {
        self.view.addSubview(self.closeButton)
        self.closeButton.constraint(top: self.view.topAnchor,
                                    trailing: self.view.trailingAnchor,
                                    padding: UIEdgeInsets(top: 46, left: 0, bottom: 0, right: 65))
        self.closeButton.constraint(.heightAnchor, constant: Size.buttonSize)
        self.closeButton.constraint(.widthAnchor, constant: Size.buttonSize)

        self.view.addSubview(self.mainSentenceView)
        self.mainSentenceView.constraint(centerX: self.view.centerXAnchor,
                                         centerY: self.view.centerYAnchor)
    }

    private func configureUI() {
        // TODO: - 컬러셋 정해지면 변경
        self.view.backgroundColor = .black.withAlphaComponent(0.94)
    }

    private func setupButtonAction() {
        let dismissAction = UIAction { [weak self] _ in
            self?.dismiss(animated: true)
        }

        self.closeButton.addAction(dismissAction, for: .touchUpInside)
    }
}
