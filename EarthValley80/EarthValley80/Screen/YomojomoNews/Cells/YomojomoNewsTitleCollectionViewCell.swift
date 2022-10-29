//
//  YomojomoNewsTitleCollectionViewCell.swift
//  EarthValley80
//
//  Created by LeeJiSoo on 2022/10/27.
//

import UIKit

final class YomojomoNewsTitleCollectionViewCell: UICollectionViewCell {

    private enum Size {
        static let categoryLabelWidth: CGFloat = 40.0
        static let categoryLabelHeigth: CGFloat = 20.0
        static let titleFontSize: CGFloat = 20.0
        static let categoryLabelFontSize: CGFloat = 12.0
    }
    // MARK: view

    private let newsBackgroundView: UIImageView = {
        let backgroundView = UIImageView()
        backgroundView.contentMode = .scaleToFill
        backgroundView.clipsToBounds = true
        backgroundView.layer.cornerRadius = 30
        // TODO: - 임시로 색상을 넣었습니다. 추후 디자인된 png를 넣을 예정입니다.
        backgroundView.backgroundColor = .evyBlack1
        return backgroundView
    }()
    let newsTitleLabel: UILabel = {
        let newsTitleLabel = UILabel()
        newsTitleLabel.numberOfLines = 0
        newsTitleLabel.font = .font(.bold, ofSize: Size.titleFontSize)
        newsTitleLabel.textColor = .white
        return newsTitleLabel
    }()
    let newsCategoryLabel: UILabel = {
        let newsCategoryLabel = UILabel()
        newsCategoryLabel.textAlignment = .center
        newsCategoryLabel.font = .font(.bold, ofSize: Size.categoryLabelFontSize)
        newsCategoryLabel.layer.masksToBounds = true
        newsCategoryLabel.layer.cornerRadius = 10
        newsCategoryLabel.layer.opacity = 0.6
        newsCategoryLabel.backgroundColor = .white
        // TODO: - 카테고리에 적절한 색상을 넣어야합니다.
        newsCategoryLabel.textColor = .evyBlack1
        return newsCategoryLabel
    }()

    // MARK: func

    func setupLayout() {
        self.addSubview(newsBackgroundView)
        newsBackgroundView.constraint(top: self.topAnchor,
                                      leading: self.leadingAnchor,
                                      bottom: self.bottomAnchor,
                                      trailing: self.trailingAnchor,
                                      padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))

        self.addSubview(newsCategoryLabel)
        newsCategoryLabel.constraint(top: self.newsBackgroundView.topAnchor,
                                     leading: self.newsBackgroundView.leadingAnchor,
                                     padding: UIEdgeInsets(top: 16, left: 16, bottom: 0, right: 0))
        self.newsCategoryLabel.constraint(.heightAnchor, constant: Size.categoryLabelHeigth)
        self.newsCategoryLabel.constraint(.widthAnchor, constant: Size.categoryLabelWidth)

        self.addSubview(newsTitleLabel)
        newsTitleLabel.constraint(top: self.newsCategoryLabel.bottomAnchor,
                                  leading: self.newsBackgroundView.leadingAnchor,
                                  trailing: self.newsBackgroundView.trailingAnchor,
                                  padding: UIEdgeInsets(top: 14, left: 20, bottom: -20, right: 0))
    }

    func setData(newsTitle: String, newsCategory: String) {
        self.newsTitleLabel.text = newsTitle
        self.newsCategoryLabel.text = newsCategory
    }
}
