//
//  SummaryViewController.swift
//  EarthValley80
//
//  Created by SHIN YOON AH on 2022/11/18.
//

import UIKit

final class SummaryViewController: UIViewController {

    private enum Size {
        static let buttonSize: CGFloat = 86.0
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

        let imageView = UIImageView(image: ImageLiteral.btnMyMainSentence)
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
                              padding: UIEdgeInsets.zero)
        titleLabel.text = StringLiteral.myMainSentenceButtonText
        titleLabel.font = .font(.bold, ofSize: 10)
        titleLabel.textColor = .evyWhite

        return button
    }()
    private lazy var summaryTextView: SummaryTextView = {
        let textView = SummaryTextView()
        textView.textMode = .beforeWriting
        textView.textViewDidEditing = { [weak self] hasText in
            self?.nextButton.isHidden = !hasText
        }
        return textView
    }()
    private lazy var nextButton: GotoSomewhereButton = {
        let button = GotoSomewhereButton(type: .white)
        let action = UIAction { [weak self] _ in
            self?.presentSummaryCompletionViewController()
        }
        button.addAction(action, for: .touchUpInside)
        // TODO: - 이 부분 텍스트를 디자인에서 정해주지 않았어요
        button.setupButtonContents(buttonImage: ImageLiteral.icArrowRight, buttonTitle: StringLiteral.completeButtonText)
        button.isHidden = true
        return button
    }()

    // MARK: - life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupLayout()
        self.configureUI()
        self.setupButtonAction()
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

        self.view.addSubview(self.nextButton)
        self.nextButton.constraint(bottom: self.view.bottomAnchor,
                                   trailing: self.view.trailingAnchor,
                                   padding: UIEdgeInsets(top: 0, left: 0, bottom: 37, right: 56))
    }

    private func configureUI() {
        // TODO: - 컬러셋 정해지면 변경
        self.view.backgroundColor = .black.withAlphaComponent(0.94)
    }

    private func setupButtonAction() {
        let presentMyMainSentenceAction = UIAction { [weak self] _ in
            let myMainSentenceViewController = MyMainSentenceViewController()

            myMainSentenceViewController.modalTransitionStyle = .crossDissolve
            myMainSentenceViewController.modalPresentationStyle = .overCurrentContext

            self?.present(myMainSentenceViewController, animated: true)
        }

        self.myMainSentenceButton.addAction(presentMyMainSentenceAction, for: .touchUpInside)
    }

    private func presentSummaryCompletionViewController() {
        let completionViewController = SummaryCompletionViewController()
        completionViewController.modalTransitionStyle = .crossDissolve
        completionViewController.modalPresentationStyle = .fullScreen
        self.present(completionViewController, animated: true)
    }

    // MARK: - selector

    @objc
    override func dismissKeyboard() {
        if !myMainSentenceButton.isTouchInside {
            view.endEditing(true)
        }
    }
}
