//
//  ReactionViewController.swift
//  EarthValley80
//
//  Created by SHIN YOON AH on 2022/11/17.
//

import UIKit

final class ReactionViewController: UIViewController {

    private enum Size {
        static let buttonSize: CGFloat = 69.0
    }

    // MARK: - property

    private let titleView: CapsuleFormTitleView = CapsuleFormTitleView(title: StringLiteral.reactionTitle)
    private lazy var headlineLabel: UILabel = {
        let label = UILabel()
        label.font = .font(.bold, ofSize: 34)
        label.text = self.newsManager.newsTitle
        label.textColor = .evyWhite
        return label
    }()
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .font(.regular, ofSize: 16)
        label.text = StringLiteral.reactionDescription
        label.textColor = .evyWhite
        return label
    }()
    private lazy var reactionButton: ReactionButton = {
        let button = ReactionButton(type: .before)
        let action = UIAction { [weak self] _ in
            self?.handleReactionEmojiViewIsHidden()
        }
        button.addAction(action, for: .touchUpInside)
        return button
    }()
    private lazy var reactionEmojiView: ReactionEmojiView = {
        let view = ReactionEmojiView()
        view.dismissEmojiView = { [weak self] type, emotion in
            self?.handleReactionEmojiViewIsHidden()

            if type == .emoji {
                guard let emotion = emotion else { return }
                self?.reactionButton.updateConfiguration(to: .after(emotion))
                self?.changeDescriptionLabelToButton()
                self?.titleView.updateTitle(to: StringLiteral.selectedReactionTitle)
            }
        }
        return view
    }()
    private lazy var nextButton: GotoSomewhereButton = {
        let button = GotoSomewhereButton(type: .white)
        let action = UIAction { [weak self] _ in
            self?.presentMainSentenceViewController()
        }
        button.addAction(action, for: .touchUpInside)
        button.setupButtonContents(buttonImage: ImageLiteral.icArrowRight, buttonTitle: StringLiteral.findCentralSentenceButtonText)
        button.isHidden = true
        return button
    }()
    private lazy var shareButton: GotoSomewhereButton = {
        let button = GotoSomewhereButton(type: .transparentWhite)
        let action = UIAction { [weak self] _ in
            self?.presentActivityViewController()
        }
        button.addAction(action, for: .touchUpInside)
        button.setupButtonContents(buttonImage: ImageLiteral.icSquareAndArrowUp, buttonTitle: StringLiteral.shareArticleButtonText)
        button.isHidden = true
        return button
    }()
    private lazy var closeButton: UIButton = {
        let button = UIButton()
        button.tintColor = .evyWhite
        button.isHidden = true

        // TODO: - 나중에 Asset 이미지 변경
        let imageView = UIImageView(image: UIImage(systemName: "xmark.circle"))
        button.addSubview(imageView)
        imageView.constraint(top: button.topAnchor, centerX: button.centerXAnchor)
        imageView.constraint(.heightAnchor, constant: Size.buttonSize)
        imageView.constraint(.widthAnchor, constant: Size.buttonSize)

        let action = UIAction { [weak self] _ in
            guard let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else { return }
            sceneDelegate.navigateToNewsFeedViewController()
        }
        button.addAction(action, for: .touchUpInside)

        return button
    }()

    private let newsManager = NewsManager.shared

    // MARK: - life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupLayout()
        self.configureUI()
    }

    // MARK: - func

    private func setupLayout() {
        self.view.addSubview(self.closeButton)
        self.closeButton.constraint(top: self.view.topAnchor,
                                    trailing: self.view.trailingAnchor,
                                    padding: UIEdgeInsets(top: 46, left: 0, bottom: 0, right: 65))
        self.closeButton.constraint(.heightAnchor, constant: Size.buttonSize)
        self.closeButton.constraint(.widthAnchor, constant: Size.buttonSize)
        
        self.view.addSubview(self.titleView)
        self.titleView.constraint(top: self.view.topAnchor,
                                  centerX: self.view.centerXAnchor,
                                  padding: UIEdgeInsets(top: 210.adjustedHeight, left: 0, bottom: 0, right: 0))

        self.view.addSubview(self.headlineLabel)
        self.headlineLabel.constraint(top: self.titleView.bottomAnchor,
                                      centerX: self.view.centerXAnchor,
                                      padding: UIEdgeInsets(top: 30, left: 0, bottom: 0, right: 0))

        self.view.addSubview(self.reactionButton)
        self.reactionButton.constraint(centerX: self.view.centerXAnchor,
                                       centerY: self.view.centerYAnchor)

        self.view.addSubview(self.descriptionLabel)
        self.descriptionLabel.constraint(top: self.reactionButton.bottomAnchor,
                                         centerX: self.view.centerXAnchor,
                                         padding: UIEdgeInsets(top: 76, left: 0, bottom: 0, right: 0))

        self.view.addSubview(self.nextButton)
        self.nextButton.constraint(top: self.reactionButton.bottomAnchor,
                                   centerX: self.view.centerXAnchor,
                                   padding: UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0))

        self.view.addSubview(self.shareButton)
        self.shareButton.constraint(top: self.nextButton.bottomAnchor,
                                    centerX: self.view.centerXAnchor,
                                    padding: UIEdgeInsets(top: 14, left: 0, bottom: 0, right: 0))
    }

    private func configureUI() {
        // TODO: - 컬러셋 정해지면 변경
        self.view.backgroundColor = .black.withAlphaComponent(0.94)
    }

    private func handleReactionEmojiViewIsHidden() {
        let hasAlreadyEmojiView = self.view.subviews.contains(self.reactionEmojiView)

        if hasAlreadyEmojiView {
            self.reactionEmojiView.isHidden.toggle()
        } else {
            self.view.addSubview(self.reactionEmojiView)
            self.reactionEmojiView.constraint(to: self.view)
        }
    }

    private func changeDescriptionLabelToButton() {
        let hasDescriptionLabel = self.view.subviews.contains(self.descriptionLabel)
        guard hasDescriptionLabel else { return }

        if hasDescriptionLabel {
            self.descriptionLabel.removeFromSuperview()
            self.nextButton.isHidden = false
            self.shareButton.isHidden = false
            self.closeButton.isHidden = false
        }
    }

    private func presentMainSentenceViewController() {
        let mainSentenceViewController = MainSentenceViewController()
        mainSentenceViewController.modalTransitionStyle = .crossDissolve
        mainSentenceViewController.modalPresentationStyle = .fullScreen
        self.present(mainSentenceViewController, animated: true)
    }

    private func presentActivityViewController() {
        let activityViewController = UIActivityViewController(activityItems: ["123213"],
                                                              applicationActivities: nil)
        activityViewController.isModalInPresentation = true
        activityViewController.popoverPresentationController?.permittedArrowDirections = []
        activityViewController.popoverPresentationController?.sourceView = self.view
        activityViewController.popoverPresentationController?.sourceRect = CGRect(x: self.view.bounds.midX,
                                                                                  y: self.view.bounds.midY,
                                                                                  width: 0,
                                                                                  height: 0)
        self.present(activityViewController, animated: true)
    }
}
