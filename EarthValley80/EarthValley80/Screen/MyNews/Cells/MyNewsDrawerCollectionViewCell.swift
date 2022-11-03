//
//  MyNewsDrawerCollectionViewCell.swift
//  EarthValley80
//
//  Created by LeeJiSoo on 2022/11/02.
//

import UIKit

final class MyNewsDrawerCollectionViewCell: UICollectionViewCell {

    private enum Size {
        static let categoryLabelWidth: CGFloat = 40.0
        static let categoryLabelHeigth: CGFloat = 20.0
        static let titleFontSize: CGFloat = 20.0
        static let categoryLabelFontSize: CGFloat = 12.0
    }

    // MARK: - property

    private let newsBackgroundView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 30
        // TODO: - 임시로 색상을 넣었습니다. 추후 디자인된 png를 넣을 예정입니다.
        imageView.backgroundColor = .evyBlack1
        return imageView
    }()
    let newsTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .font(.bold, ofSize: Size.titleFontSize)
        label.textColor = .white
        return label
    }()
    let newsCategoryLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .font(.bold, ofSize: Size.categoryLabelFontSize)
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 10
        label.layer.opacity = 0.6
        label.backgroundColor = .white
        // TODO: - 카테고리에 적절한 색상을 넣어야합니다.
        label.textColor = .evyBlack1
        return label
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
        self.addSubview(self.newsBackgroundView)
        self.newsBackgroundView.constraint(to: self)

        self.addSubview(self.newsCategoryLabel)
        self.newsCategoryLabel.constraint(top: self.newsBackgroundView.topAnchor,
                                     leading: self.newsBackgroundView.leadingAnchor,
                                     padding: UIEdgeInsets(top: 16, left: 16, bottom: 0, right: 0))
        self.newsCategoryLabel.constraint(.heightAnchor, constant: Size.categoryLabelHeigth)
        self.newsCategoryLabel.constraint(.widthAnchor, constant: Size.categoryLabelWidth)

        self.addSubview(self.newsTitleLabel)
        self.newsTitleLabel.constraint(top: self.newsCategoryLabel.bottomAnchor,
                                  leading: self.newsBackgroundView.leadingAnchor,
                                  trailing: self.newsBackgroundView.trailingAnchor,
                                  padding: UIEdgeInsets(top: 14, left: 20, bottom: -20, right: 0))
    }

    func setData(_ newsData: News) {
        self.newsTitleLabel.text = newsData.title
        self.newsCategoryLabel.text = newsData.category
    }
}