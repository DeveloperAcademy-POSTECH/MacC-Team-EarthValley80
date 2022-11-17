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
        static let emotionImageSize: CGFloat = 80.0
    }

    @frozen
    enum Emotion {
        case fun
        case sad
        case scary
        case angry
        case surprise

        // TODO: - 후에 이모지 Image로 변경
        var color: UIColor {
            switch self {
            case .fun:
                return .yellow
            case .sad:
                return .blue
            case .scary:
                return .green
            case .angry:
                return .red
            case .surprise:
                return .orange
            }
        }
    }

    @frozen
    enum ButtonType {
        case before
        case pressed
        case after(Emotion)
        case emotion(Emotion)

        // TODO: - 후에 이모지 Image로 변경
        var color: UIColor? {
            switch self {
            case .before:
                return .brown
            case .pressed:
                return .cyan
            case .after(let emotion):
                return emotion.color
            case .emotion(let emotion):
                return emotion.color
            }
        }

        var imageSize: CGFloat {
            switch self {
            case .emotion:
                return Size.emotionImageSize
            default:
                return Size.imageSize
            }
        }
    }

    // MARK: - property

    private let reactionButtonImageView: UIImageView = {
        let imageView = UIImageView()
        // TODO: - 이미지 에셋으로 변경해야 합니다.
        imageView.backgroundColor = .brown
        return imageView
    }()
    private let reactionLabel: UILabel = {
        let label = UILabel()
        label.font = .font(.regular, ofSize: 14)
        label.textColor = .evyWhite
        return label
    }()

    // MARK: - init

    init(type: ButtonType) {
        super.init(frame: .zero)
        self.setupLayout(type: type)
        self.configureUI(type: type)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - func

    private func setupLayout(type: ButtonType) {
        self.addSubview(self.reactionButtonImageView)
        self.reactionButtonImageView.constraint(top: self.topAnchor,
                                                leading: self.leadingAnchor,
                                                trailing: self.trailingAnchor,
                                                padding: UIEdgeInsets.zero)
        self.constraint(.heightAnchor, constant: type.imageSize)
        self.constraint(.widthAnchor, constant: type.imageSize)

        self.addSubview(self.reactionLabel)
        self.reactionLabel.constraint(top: self.reactionButtonImageView.bottomAnchor,
                                      leading: self.leadingAnchor,
                                      bottom: self.bottomAnchor,
                                      trailing: self.trailingAnchor,
                                      padding: UIEdgeInsets(top: 8, left: 0, bottom: 0, right: 0))
    }

    private func configureUI(type: ButtonType) {
        self.backgroundColor = type.color
    }
}
