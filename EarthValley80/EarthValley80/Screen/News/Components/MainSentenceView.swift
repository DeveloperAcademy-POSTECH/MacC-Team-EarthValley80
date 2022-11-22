//
//  MainSentenceView.swift
//  EarthValley80
//
//  Created by SHIN YOON AH on 2022/11/18.
//

import UIKit

final class MainSentenceView: UIView {

    private enum Size {
        static let height: CGFloat = 634.adjustedHeight
        static let width: CGFloat = 573.adjustedWidth
    }

    // MARK: - init

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupLayout()
        self.configureUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - func

    private func setupLayout() {
        self.constraint(.heightAnchor, constant: Size.height)
        self.constraint(.widthAnchor, constant: Size.width)
    }

    private func configureUI() {
        self.backgroundColor = .white
        self.layer.cornerRadius = 30
        self.layer.masksToBounds = true
    }
}
