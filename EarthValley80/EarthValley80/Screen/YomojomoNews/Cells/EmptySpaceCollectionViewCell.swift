//
//  EmptySpaceCollectionViewCell.swift
//  EarthValley80
//
//  Created by LeeJiSoo on 2022/10/28.
//

import UIKit

import Lottie

final class EmptySpaceCollectionViewCell: UICollectionViewCell {

    // MARK: - property

    private lazy var emptySpaceLottieView: LottieAnimationView = {
        let animationView = LottieAnimationView(name: "mp4TempFile")
        animationView.play()
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .repeat(2)
        return animationView
    }()

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

    func setupLayout() {
        self.contentView.addSubview(self.emptyBackgroundView)
        self.emptyBackgroundView.constraint(to: self,
                                          insets: UIEdgeInsets.zero)
    }
}
