//
//  UserGoalAttainmentLottieCollectionViewCell.swift
//  EarthValley80
//
//  Created by LeeJiSoo on 2022/11/06.
//

import UIKit

import Lottie

final class UserGoalAttainmentLottieCollectionViewCell: UICollectionViewCell {

    // MARK: - property

    override var isSelected: Bool {
        didSet {
            if self.isSelected {
                self.lottieView.play()
            }
        }
    }

    private let attainmentBackgroundView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 30
        // TODO: - 로티를 넣어야합니다.
        imageView.backgroundColor = .red
        return imageView
    }()
    private let attainmentLabel: UILabel = {
        let label = UILabel()
        // TODO: - 더미데이터, 나중에 지우겠습니다.
        label.text = "기사를 요약했구나"
        label.font = .font(.bold, ofSize: 10)
        label.textAlignment = .center
        return label
    }()
    private lazy var lottieView: LottieAnimationView = {
        let animationView = LottieAnimationView(name: lottieName)
        animationView.play()
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .repeat(2)
        return animationView
    }()
    // TODO: - lottie뷰 이름을 랜덤으로 돌려줘야 함
    private lazy var lottieName: String = ""

    // MARK: - init

    override init(frame: CGRect) {
        super .init(frame: frame)
        self.setupLayout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    // MARK: - func

    private func setupLayout() {
        self.contentView.addSubview(self.lottieView)
        self.lottieView.constraint(top: self.contentView.topAnchor,
                                   leading: self.contentView.leadingAnchor,
                                   trailing: self.contentView.trailingAnchor,
                                   padding: UIEdgeInsets(top: 30, left: 28, bottom: 0, right: 28))
        self.lottieView.constraint(.heightAnchor, constant: (self.bounds.size.width - 56) * 0.752)

        self.contentView.addSubview(self.attainmentLabel)
        self.attainmentLabel.constraint(leading: self.lottieView.leadingAnchor,
                                        bottom: self.contentView.bottomAnchor,
                                        trailing: self.lottieView.trailingAnchor,
                                        padding: UIEdgeInsets(top: 0, left: 0, bottom: 24, right: 0))
    }

    func setLottieImage(to lottieName: String) {
        self.lottieName = lottieName
    }

    func setLottieImage(to lottieImageTitle: String) {
        self.lottieName = lottieImageTitle
    }
}
