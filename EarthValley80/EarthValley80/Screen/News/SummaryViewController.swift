//
//  SummaryViewController.swift
//  EarthValley80
//
//  Created by SHIN YOON AH on 2022/11/18.
//

import UIKit

final class SummaryViewController: UIViewController {

    private enum Size {
        static let buttonSize: CGFloat = 69.0
    }

    // MARK: - property

    private let captionLabel: UILabel = {
        let label = UILabel()
        label.font = .font(.bold, ofSize: 15)
        label.text = StringLiteral.readingNewsCaptionTitle
        label.textColor = .evyWhite
        return label
    }()
    private let backButton = BackButton()
    private let titleView: CapsuleFormTitleView = CapsuleFormTitleView(title: StringLiteral.summaryTitle)
    private let myMainSentenceButton: UIButton = {
        let button = UIButton()

        // TODO: - 나중에 Asset 이미지 변경
        let imageView = UIImageView(image: UIImage(systemName: "pencil.circle"))
        button.addSubview(imageView)
        imageView.constraint(top: button.topAnchor, centerX: button.centerXAnchor)
        imageView.constraint(.heightAnchor, constant: Size.buttonSize)
        imageView.constraint(.widthAnchor, constant: Size.buttonSize)
        imageView.makeShadow(color: .evyBlack1, opacity: 0.3, offset: CGSize.zero, radius: 7)

        let titleLabel = UILabel()
        button.addSubview(titleLabel)
        titleLabel.constraint(top: imageView.bottomAnchor,
                              leading: button.leadingAnchor,
                              bottom: button.bottomAnchor,
                              trailing: button.trailingAnchor,
                              padding: UIEdgeInsets(top: 8, left: 0, bottom: 0, right: 0))
        titleLabel.text = StringLiteral.myMainSentenceButtonText
        titleLabel.font = .font(.bold, ofSize: 10)
        titleLabel.textColor = .evyWhite

        return button
    }()
    private let summaryTextView: SummaryTextView = {
        let textView = SummaryTextView()
        textView.textMode = .beforeWriting
        return textView
    }()

    // MARK: - life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupLayout()
        self.configureUI()
        self.hideKeyboardWhenTappedAround()
    }

    // MARK: - func

    private func setupLayout() {
        self.view.addSubview(self.backButton)
        self.backButton.constraint(top: self.view.topAnchor,
                                   leading: self.view.leadingAnchor,
                                   padding: UIEdgeInsets(top: 26, left: 10, bottom: 0, right: 0))

        self.view.addSubview(self.captionLabel)
        self.captionLabel.constraint(top: self.view.topAnchor,
                                     centerX: self.view.centerXAnchor,
                                     padding: UIEdgeInsets(top: 40, left: 0, bottom: 0, right: 0))

        self.view.addSubview(self.titleView)
        self.titleView.constraint(top: self.captionLabel.bottomAnchor,
                                  centerX: self.view.centerXAnchor,
                                  padding: UIEdgeInsets(top: 44, left: 0, bottom: 0, right: 0))

        self.view.addSubview(self.myMainSentenceButton)
        self.myMainSentenceButton.constraint(top: self.view.topAnchor,
                                             trailing: self.view.trailingAnchor,
                                             padding: UIEdgeInsets(top: 46, left: 0, bottom: 0, right: 60))

        self.view.addSubview(self.summaryTextView)
        self.summaryTextView.constraint(top: self.myMainSentenceButton.bottomAnchor,
                                        leading: self.view.leadingAnchor,
                                        bottom: self.view.bottomAnchor,
                                        trailing: self.view.trailingAnchor,
                                        padding: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0))
    }

    private func configureUI() {
        // TODO: - 컬러셋 정해지면 변경
        self.view.backgroundColor = .black.withAlphaComponent(0.94)
    }

    // MARK: - selector

    @objc
    override func dismissKeyboard() {
        if !myMainSentenceButton.isTouchInside {
            view.endEditing(true)
        }
    }
}
