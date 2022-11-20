//
//  YomojomoNewsCollectionViewCell.swift
//  EarthValley80
//
//  Created by LeeJiSoo on 2022/11/20.
//

import UIKit

final class YomojomoNewsCollectionViewCell: UICollectionViewCell {

    private enum Size {
        static let categoryLabelFontSize: CGFloat = 16.0
        static let newsTitleFontSize: CGFloat = 28.0
        static let categoryImageSize: CGFloat = 155.0
        static let newsTitleImageSize: CGFloat = 233.0
        static let categoryLabelHeight: CGFloat = 26.0
        static let categoryLabelPadding: CGFloat = 24.0
    }

    // MARK: - property

    private let cellBackground: UIView =  {
        let backgroundview = UIView()
        return backgroundview
    }()
    private let categoryBackgroundImageView: UIImageView = {
        // TODO: - 기사에 맞는 카테고리 이미지로 변경해야합니다.
        let imageview = UIImageView()
        imageview.contentMode = .scaleToFill
        imageview.clipsToBounds = true
        imageview.layer.cornerRadius = 12.0
        imageview.backgroundColor = .red
        return imageview
    }()
    private let newsImageView: UIImageView = {
        // TODO: - 기사에 맞는 뉴스 대표이미지로 변경해야합니다.
        let imageview = UIImageView()
        imageview.contentMode = .scaleToFill
        imageview.clipsToBounds = true
        imageview.layer.cornerRadius = 12.0
        imageview.backgroundColor = .blue
        return imageview
    }()
    private let newsCategoryLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .font(.bold, ofSize: Size.categoryLabelFontSize)
        label.textColor = .evyWhite
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 13
        // TODO: - 카테고리 색상별로 색을 바꿔주어야 합니다.
        label.backgroundColor = .systemOrange
        return label
    }()
    private let newsTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.font = .font(.bold, ofSize: Size.newsTitleFontSize)
        label.lineBreakStrategy = .hangulWordPriority
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

    private func setupLayout() {
        self.contentView.addSubview(self.cellBackground)
        self.cellBackground.constraint(to: self)

        self.cellBackground.addSubview(self.categoryBackgroundImageView)
        self.categoryBackgroundImageView.constraint(top: self.cellBackground.topAnchor,
                                                    trailing: self.cellBackground.trailingAnchor,
                                                    padding: UIEdgeInsets(top: 113, left: 0, bottom: 0, right: 0))
        self.categoryBackgroundImageView.constraint(.widthAnchor, constant: Size.categoryImageSize)
        self.categoryBackgroundImageView.constraint(.heightAnchor, constant: Size.categoryImageSize)

        self.cellBackground.addSubview(self.newsImageView)
        self.newsImageView.constraint(top: self.cellBackground.topAnchor,
                                      leading: self.cellBackground.leadingAnchor,
                                      padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        self.newsImageView.constraint(.widthAnchor, constant: Size.newsTitleImageSize)
        self.newsImageView.constraint(.heightAnchor, constant: Size.newsTitleImageSize)

        self.cellBackground.addSubview(self.newsCategoryLabel)
        self.newsCategoryLabel.constraint(top: self.newsImageView.bottomAnchor,
                                          leading: self.newsImageView.leadingAnchor,
                                          padding: UIEdgeInsets(top: 30, left: 0, bottom: 0, right: 0))
        self.newsCategoryLabel.constraint(.heightAnchor, constant: Size.categoryLabelHeight)

        self.cellBackground.addSubview(self.newsTitleLabel)
        self.newsTitleLabel.constraint(top: self.newsCategoryLabel.bottomAnchor,
                                       leading: self.newsCategoryLabel.leadingAnchor,
                                       trailing: self.cellBackground.trailingAnchor,
                                       padding: UIEdgeInsets(top: 8, left: 0, bottom: 0, right: 0))
    }

    func setData(with news: News) {
        newsTitleLabel.text = news.title
        newsCategoryLabel.text = news.category
    }

    func calculateLabelWidth(_ newsData: News) {
        let label = UILabel()
        label.font = .font(.bold, ofSize: Size.categoryLabelFontSize)
        label.text = newsData.category
        label.sizeToFit()
        self.newsCategoryLabel.constraint(.widthAnchor, constant: label.frame.width + Size.categoryLabelPadding)
    }
}
