//
//  AchieveSummaryLottieCollectionViewCell.swift
//  EarthValley80
//
//  Created by LeeJiSoo on 2022/11/06.
//

import UIKit

import Lottie

final class AchieveSummaryLottieCollectionViewCell: UICollectionViewCell {

    // MARK: view

    private let addBackgroundView: UIImageView = {
        let addBackgroundView = UIImageView()
        addBackgroundView.contentMode = .scaleToFill
        addBackgroundView.clipsToBounds = true
        addBackgroundView.layer.cornerRadius = 30
        // TODO: - 로티를 넣어야합니다.
        addBackgroundView.backgroundColor = .red
        return addBackgroundView
    }()
    private lazy var lottieView: LottieAnimationView = {
        let animationView = LottieAnimationView(name: lottieName)
        animationView.play()
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        return animationView
    }()
    // TODO: - lottie뷰 이름을 랜덤으로 돌려줘야 함
    private lazy var lottieName: String = "mp4TempFile"

    // MARK: method

    func setupLayout() {
        self.contentView.addSubview(addBackgroundView)
        self.addBackgroundView.constraint(to: self, insets: UIEdgeInsets.zero)

        self.addBackgroundView.addSubview(self.lottieView)
        self.lottieView.constraint(to: self.addBackgroundView, insets: UIEdgeInsets.zero)
    }
}
