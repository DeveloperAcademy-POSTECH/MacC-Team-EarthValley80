//
//  ReactionButton.swift
//  EarthValley80
//
//  Created by SHIN YOON AH on 2022/11/17.
//

import UIKit

final class ReactionButton: UIButton {

    private enum Size {
        static let imageSize: CGFloat = 91.0
        static let emotionImageSize: CGFloat = 116.0
        static let smallerEmotionImageSize: CGFloat = 39.0
        static let smallerEmojiSpacing: CGFloat = 26.0
    }

    @frozen
    enum Emotion {
        case fun
        case sad
        case scary
        case angry
        case surprise

        var image: UIImage {
            switch self {
            case .fun:
                return ImageLiteral.icoFun
            case .sad:
                return ImageLiteral.icoSad
            case .scary:
                return ImageLiteral.icoScary
            case .angry:
                return ImageLiteral.icoAngry
            case .surprise:
                return ImageLiteral.icoSurprised
            }
        }

        var title: String {
            switch self {
            case .fun:
                return StringLiteral.funEmotionCaption
            case .sad:
                return StringLiteral.sadEmotionCaption
            case .scary:
                return StringLiteral.scaryEmotionCaption
            case .angry:
                return StringLiteral.angryEmotionCaption
            case .surprise:
                return StringLiteral.surpriseEmotionCaption
            }
        }
    }

    @frozen
    enum ButtonType {
        case before
        case pressed
        case after(Emotion)
        case emotion(Emotion)

        var image: UIImage? {
            switch self {
            case .before:
                return ImageLiteral.btnBeforeReaction
            case .pressed:
                return ImageLiteral.btnAfterReaction
            case .after(let emotion):
                return emotion.image
            case .emotion(let emotion):
                return emotion.image
            }
        }

        var imageSize: CGFloat {
            switch self {
            case .emotion:
                return Size.emotionImageSize
            case .after:
                return Size.smallerEmotionImageSize
            default:
                return Size.imageSize
            }
        }

        var title: String {
            switch self {
            case .emotion(let emotion):
                return emotion.title
            case .after(let emotion):
                return emotion.title
            default:
                return " "
            }
        }
    }

    // MARK: - property

    private let reactionButtonImageView: UIImageView = UIImageView()
    private let alphaBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .evyWhite.withAlphaComponent(0.14)
        view.layer.cornerRadius = Size.imageSize / 2
        view.isHidden = true
        view.isUserInteractionEnabled = false
        return view
    }()
    private let reactionLabel: UILabel = {
        let label = UILabel()
        label.font = .font(.regular, ofSize: 14)
        label.textColor = .evyWhite
        label.textAlignment = .center
        return label
    }()

    private var imageViewInsetConstraints: [ConstraintType: NSLayoutConstraint]?
    private var imageViewHeightConstraint: [Frame: NSLayoutConstraint]?
    private var imageViewWidthConstraint: [Frame: NSLayoutConstraint]?
    var emotion: Emotion?

    // MARK: - init

    init(type: ButtonType) {
        super.init(frame: .zero)
        self.setupLayout(type: type)
        self.updateConfiguration(to: type)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - func

    private func setupLayout(type: ButtonType) {
        self.addSubview(self.alphaBackgroundView)
        self.alphaBackgroundView.constraint(top: self.topAnchor,
                                            leading: self.leadingAnchor,
                                            trailing: self.trailingAnchor,
                                            padding: UIEdgeInsets.zero)
        self.alphaBackgroundView.constraint(.heightAnchor, constant: type.imageSize)
        self.alphaBackgroundView.constraint(.widthAnchor, constant: type.imageSize)

        self.addSubview(self.reactionButtonImageView)
        self.imageViewInsetConstraints = self.reactionButtonImageView.constraint(top: self.topAnchor,
                                                                                 centerX: self.centerXAnchor,
                                                                                 padding: UIEdgeInsets.zero)
        self.imageViewHeightConstraint = self.reactionButtonImageView.constraint(.heightAnchor,
                                                                                 constant: type.imageSize)
        self.imageViewWidthConstraint = self.reactionButtonImageView.constraint(.widthAnchor,
                                                                                constant: type.imageSize)

        self.addSubview(self.reactionLabel)
        self.reactionLabel.constraint(top: self.alphaBackgroundView.bottomAnchor,
                                      leading: self.leadingAnchor,
                                      bottom: self.bottomAnchor,
                                      trailing: self.trailingAnchor,
                                      padding: UIEdgeInsets(top: 8, left: 0, bottom: 0, right: 0))
    }

    private func updateEmotionType(with type: ButtonType) {
        switch type {
        case .emotion(let emotion):
            self.emotion = emotion
        default:
            break
        }
    }

    func updateConfiguration(to type: ButtonType) {
        self.reactionButtonImageView.image = type.image
        self.reactionLabel.text = type.title

        self.updateEmotionType(with: type)
        self.updateAlphaBackgroundIsHidden(to: type)
    }

    func updateAlphaBackgroundIsHidden(to type: ButtonType) {
        switch type {
        case .after:
            self.imageViewInsetConstraints?[.top]?.constant = Size.smallerEmojiSpacing
            self.imageViewHeightConstraint?[.heightAnchor]?.constant = type.imageSize
            self.imageViewWidthConstraint?[.widthAnchor]?.constant = type.imageSize
            self.alphaBackgroundView.isHidden = false
        default:
            self.alphaBackgroundView.isHidden = true
        }
    }
}
