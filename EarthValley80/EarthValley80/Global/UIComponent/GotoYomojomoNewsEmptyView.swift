//
//  GotoYomojomoNewsEmptyView.swift
//  EarthValley80
//
//  Created by LeeJiSoo on 2022/10/31.
//

import UIKit

import Lottie

final class GotoYomojomoNewsEmptyView: UIView {

    private enum Size {
        static let lottieViewWidth: CGFloat = 407
        static let lotteiViewHeight: CGFloat = 240
        static let buttonWidth: CGFloat = 205
        static let buttonHeight: CGFloat = 50
    }

    // MARK: - property
    
    private lazy var stackview: UIStackView = {
        let stackview = UIStackView()
        stackview.alignment = .center
        stackview.axis = .vertical
        return stackview
    }()
    private let greetingLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .black
        label.sizeThatFits(label.frame.size)
        return label
    }()
    private lazy var lottieView: LottieAnimationView = {
        let animationView = LottieAnimationView(name: lottieName)
        animationView.play()
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        return animationView
    }()

    private let gotoButton = GotoSomewhereButton()
    private lazy var lottieName: String = ""

    // MARK: - init

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupLayout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // MARK: - func

    private func setupLayout() {
        self.addSubview(self.stackview)
        self.stackview.constraint(top: self.topAnchor,
                             leading: self.leadingAnchor,
                             padding: UIEdgeInsets.zero)

        self.stackview.addArrangedSubview(self.greetingLabel)
        self.stackview.addArrangedSubview(self.lottieView)
        self.stackview.addArrangedSubview(self.gotoButton)

        self.lottieView.constraint(.widthAnchor, constant: Size.lottieViewWidth)
        self.lottieView.constraint(.heightAnchor, constant: Size.lotteiViewHeight)

        self.gotoButton.constraint(.widthAnchor, constant: Size.buttonWidth)
        self.gotoButton.constraint(.heightAnchor, constant: Size.buttonHeight)

        self.stackview.setCustomSpacing(20, after: self.greetingLabel)
        self.stackview.setCustomSpacing(53, after: self.lottieView)
    }

    func changeLabelText(greetingComments: String,
                         lottieImageTitle: String,
                         buttonImage: UIImage,
                         buttonTitle: String) {
        self.greetingLabel.text = greetingComments
        self.lottieName = lottieImageTitle
        self.gotoButton.setImage(buttonImage, for: .normal)
        self.gotoButton.setTitle(buttonTitle, for: .normal)
    }
}
