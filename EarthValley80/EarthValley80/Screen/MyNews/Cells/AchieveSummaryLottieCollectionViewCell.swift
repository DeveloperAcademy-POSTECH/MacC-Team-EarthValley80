//
//  AchieveSummaryLottieCollectionViewCell.swift
//  EarthValley80
//
//  Created by LeeJiSoo on 2022/11/06.
//

import UIKit

import Lottie

final class AchieveSummaryLottieCollectionViewCell: UICollectionViewCell {

    // MARK: - property

    override var isSelected: Bool {
        didSet {
            if self.isSelected {
                self.lottieView.play()
            }
        }
    }

    private let addBackgroundView: UIImageView = {
        let addBackgroundView = UIImageView()
        addBackgroundView.contentMode = .scaleToFill
        addBackgroundView.clipsToBounds = true
        addBackgroundView.layer.cornerRadius = 30
        // TODO: - 로티를 넣어야합니다.
        addBackgroundView.backgroundColor = .red
        return addBackgroundView
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
        self.contentView.addSubview(self.addBackgroundView)
        self.addBackgroundView.constraint(to: self, insets: UIEdgeInsets.zero)

        self.addBackgroundView.addSubview(self.lottieView)
        self.lottieView.constraint(top: self.addBackgroundView.topAnchor,
                                   leading: self.addBackgroundView.leadingAnchor,
                                   trailing: self.addBackgroundView.trailingAnchor,
                                   padding: UIEdgeInsets(top: 30, left: 28, bottom: 0, right: 28))

        self.addBackgroundView.addSubview(self.attainmentLabel)
        self.attainmentLabel.constraint(top: self.lottieView.bottomAnchor,
                                        leading: self.lottieView.leadingAnchor,
                                        bottom: self.addBackgroundView.bottomAnchor,
                                        trailing: self.lottieView.trailingAnchor,
                                        padding: UIEdgeInsets(top: 25, left: 0, bottom: 24, right: 0))
    }

    func setLottieImage(to lottieImageTitle: String) {
        self.lottieName = lottieImageTitle
    }
}
