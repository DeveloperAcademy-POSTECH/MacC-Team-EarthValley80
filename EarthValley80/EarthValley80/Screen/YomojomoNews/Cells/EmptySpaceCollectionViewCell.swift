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

    override var isSelected: Bool {
        didSet {
            if self.isSelected {
                self.emptySpaceLottieView.play()
            }
        }
    }

    private lazy var emptySpaceLottieView: LottieAnimationView = {
        let animationView = LottieAnimationView(name: StringLiteral.tempLottieFile)
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

    private func setupLayout() {
        self.contentView.addSubview(self.emptySpaceLottieView)
        self.emptySpaceLottieView.constraint(to: self,
                                          insets: UIEdgeInsets.zero)
    }
}
