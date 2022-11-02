//
//  EmptySpaceCollectionViewCell.swift
//  EarthValley80
//
//  Created by LeeJiSoo on 2022/10/28.
//

import UIKit

final class EmptySpaceCollectionViewCell: UICollectionViewCell {

    // MARK: view

    private let addBackgroundView: UIImageView = {
        let backgroundView = UIImageView()
        backgroundView.contentMode = .scaleToFill
        backgroundView.clipsToBounds = true
        backgroundView.layer.cornerRadius = 30
        // TODO: - 카테고리에 적절한 색상을 넣어야합니다.
        backgroundView.backgroundColor = .red
        return backgroundView
    }()

    // MARK: method

    func setupLayout() {
        self.addSubview(self.addBackgroundView)
        self.addBackgroundView.constraint(to: self,
                                          insets: UIEdgeInsets.zero)
    }
}
