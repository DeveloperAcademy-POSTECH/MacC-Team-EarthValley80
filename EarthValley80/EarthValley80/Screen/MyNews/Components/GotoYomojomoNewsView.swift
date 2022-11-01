//
//  GotoYomojomoNewsView.swift
//  EarthValley80
//
//  Created by LeeJiSoo on 2022/10/31.
//

import UIKit

import Lottie

class GotoYomojomoNewsView: UIView {

    private enum Size {
        static let greetingCommentLabelFontSize: CGFloat = 16
    }

    // MARK: - property

    private let greetingComment: UILabel = {
        let label = UILabel()
        label.text = StringLiteral.greetingComments
        label.numberOfLines = 0
//        label.sizeToFit()
        label.font = .font(.bold, ofSize: Size.greetingCommentLabelFontSize)
        label.textAlignment = .center
        label.textColor = .evyBlack1
        return label
    }()
    // TODO: - 추후 lottie 파일 받아서 animationview로 바꿔야함
    private let lottieImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.backgroundColor = .red
        return imageView
    }()
    private let gotoYomojomoNewsButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        return button
    }()

    // MARK: - init

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupLayout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // MARK: - life cycle

    private func setupLayout() {
        self.addSubview(self.greetingComment)
        self.greetingComment.constraint(top: self.topAnchor,
                                        centerX: self.centerXAnchor,
                                        padding: UIEdgeInsets.zero)

        self.addSubview(self.lottieImageView)
        self.lottieImageView.constraint(top: self.greetingComment.bottomAnchor,
                                        centerX: self.greetingComment.centerXAnchor,
                                        padding: UIEdgeInsets(top: 20, left: 276, bottom: 307, right: 276))
//        self.lottieImageView.constraint(.widthAnchor, constant: 434)
//        self.lottieImageView.constraint(.heightAnchor, constant: 289)

        self.addSubview(self.gotoYomojomoNewsButton)
        self.gotoYomojomoNewsButton.constraint(top: self.lottieImageView.bottomAnchor,
                                               bottom: self.bottomAnchor,
                                               centerX: self.centerXAnchor,
                                               padding: UIEdgeInsets(top: 53, left: 0, bottom: 0, right: 0))
    }
}
