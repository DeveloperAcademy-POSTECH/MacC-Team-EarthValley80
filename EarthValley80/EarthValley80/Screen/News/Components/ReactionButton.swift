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

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupLayout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - func

    private func setupLayout() {
        self.addSubview(self.reactionButtonImageView)
        self.reactionButtonImageView.constraint(top: self.topAnchor,
                                                leading: self.leadingAnchor,
                                                trailing: self.trailingAnchor,
                                                padding: UIEdgeInsets.zero)
        self.constraint(.heightAnchor, constant: Size.imageSize)
        self.constraint(.widthAnchor, constant: Size.imageSize)

        self.addSubview(self.reactionLabel)
        self.reactionLabel.constraint(top: self.reactionButtonImageView.bottomAnchor,
                                      leading: self.leadingAnchor,
                                      bottom: self.bottomAnchor,
                                      trailing: self.trailingAnchor,
                                      padding: UIEdgeInsets(top: 8, left: 0, bottom: 0, right: 0))
    }
}
