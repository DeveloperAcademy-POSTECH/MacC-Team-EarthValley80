//
//  ReactionEmojiView.swift
//  EarthValley80
//
//  Created by SHIN YOON AH on 2022/11/17.
//

import UIKit

final class ReactionEmojiView: UIView {

    typealias SelectedEmotionData = ((SelectedType, ReactionButton.Emotion?) -> ())

    private enum Size {
        static let topSpacingBetweenFirstToSecondNode: CGFloat = 45.0
        static let topSpacingBetweenSecondToThirdNode: CGFloat = 15.0
        static let horizontalSpacingBetweenMiddleToFirstSideNode: CGFloat = 35.0
        static let horizontalSpacingBetweenMiddleToSecondSideNode: CGFloat = 79.0
    }

    enum SelectedType {
        case emoji, dismiss
    }

    var dismissEmojiView: SelectedEmotionData?

    // MARK: - property

    private let dismissButton: ReactionButton = ReactionButton(type: .pressed)
    private let funReactionButton: ReactionButton = ReactionButton(type: .emotion(.fun))
    private let sadReactionButton: ReactionButton = ReactionButton(type: .emotion(.sad))
    private let scaryReactionButton: ReactionButton = ReactionButton(type: .emotion(.scary))
    private let angryReactionButton: ReactionButton = ReactionButton(type: .emotion(.angry))
    private let surpriseReactionButton: ReactionButton = ReactionButton(type: .emotion(.surprise))

    // MARK: - init

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupLayout()
        self.configureUI()
        self.setupButtonAction()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - func

    private func setupLayout() {
        self.addSubview(self.dismissButton)
        self.dismissButton.constraint(centerX: self.centerXAnchor,
                                       centerY: self.centerYAnchor)

        self.addSubview(self.scaryReactionButton)
        self.scaryReactionButton.constraint(bottom: self.dismissButton.topAnchor,
                                            centerX: self.centerXAnchor,
                                            padding: UIEdgeInsets(top: 0, left: 0, bottom: 55, right: 0))

        self.addSubview(self.sadReactionButton)
        self.sadReactionButton.constraint(top: self.scaryReactionButton.topAnchor,
                                          trailing: self.scaryReactionButton.leadingAnchor,
                                          padding: UIEdgeInsets(top: Size.topSpacingBetweenFirstToSecondNode, left: 0, bottom: 0, right: Size.horizontalSpacingBetweenMiddleToFirstSideNode))

        self.addSubview(self.angryReactionButton)
        self.angryReactionButton.constraint(top: self.scaryReactionButton.topAnchor,
                                            leading: self.scaryReactionButton.trailingAnchor,
                                            padding: UIEdgeInsets(top: Size.topSpacingBetweenFirstToSecondNode, left: Size.horizontalSpacingBetweenMiddleToFirstSideNode, bottom: 0, right: 0))

        self.addSubview(self.funReactionButton)
        self.funReactionButton.constraint(top: self.sadReactionButton.bottomAnchor,
                                          trailing: self.scaryReactionButton.leadingAnchor,
                                          padding: UIEdgeInsets(top: Size.topSpacingBetweenSecondToThirdNode, left: 0, bottom: 0, right: Size.horizontalSpacingBetweenMiddleToSecondSideNode))

        self.addSubview(self.surpriseReactionButton)
        self.surpriseReactionButton.constraint(top: self.angryReactionButton.bottomAnchor,
                                              leading: self.scaryReactionButton.trailingAnchor,
                                              padding: UIEdgeInsets(top: Size.topSpacingBetweenSecondToThirdNode, left: Size.horizontalSpacingBetweenMiddleToSecondSideNode, bottom: 0, right: 0))

    }

    private func configureUI() {
        // TODO: - ????????? ???????????? ??????
        self.backgroundColor = .black.withAlphaComponent(0.94)
    }

    private func setupButtonAction() {
        let dismissAction = UIAction { [weak self] _ in
            self?.dismissEmojiView?(.dismiss, nil)
        }
        self.dismissButton.addAction(dismissAction, for: .touchUpInside)

        [self.funReactionButton,
         self.sadReactionButton,
         self.scaryReactionButton,
         self.angryReactionButton,
         self.surpriseReactionButton].forEach { item in
            item.addTarget(self, action: #selector(self.didTappedEmotion(_:)), for: .touchUpInside)
        }
    }

    // MARK: - selector

    @objc
    private func didTappedEmotion(_ sender: UIButton) {
        guard let button = sender as? ReactionButton else { return }
        let emotion = button.emotion

        self.dismissEmojiView?(.emoji, emotion)
    }
}
