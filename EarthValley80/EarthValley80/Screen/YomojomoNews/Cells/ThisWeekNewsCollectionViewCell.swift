//
//  ThisWeekNewsCollectionViewCell.swift
//  EarthValley80
//
//  Created by LeeJiSoo on 2022/10/27.
//

import UIKit

final class ThisWeekNewsCollectionViewCell: UICollectionViewCell {

    private enum Size {
        static let standardOfTitle: Int = 30
        static let categoryLabelHeigth: CGFloat = 20.0
        static let categoryCornerRadius: CGFloat = 10.0
        static let newsCardCornerRadius: CGFloat = 30.0
        static let titleFontSize: CGFloat = 20.0
        static let categoryLabelFontSize: CGFloat = 12.0
        static let categoryLabelPadding: CGFloat = 18.0
    }

    private enum CardUI: String {
        case economy = "경제"
        case science = "과학"
        case culture = "문화"
        case society = "시사"

        var categoryBackgroundColor: UIColor {
            switch self {
            case .economy:
                return .evyCategoryEcnmy
            case .science:
                return .evyCategorySic
            case .culture:
                return .evyCategoryCul
            case .society:
                return .evyCategorySoci
            }
        }
    }
    
    // MARK: - property

    private let newsBackgroundView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = Size.newsCardCornerRadius
        return imageView
    }()
    private let newsTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .font(.bold, ofSize: Size.titleFontSize)
        label.textColor = .evyWhite
        return label
    }()
    private let newsCategoryLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .font(.bold, ofSize: Size.categoryLabelFontSize)
        label.layer.masksToBounds = true
        label.layer.cornerRadius = Size.categoryCornerRadius
        label.backgroundColor = .evyWhite
        label.layer.opacity = 0.6
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
        self.contentView.addSubview(self.newsBackgroundView)
        self.newsBackgroundView.constraint(to: self)

        self.addSubview(self.newsCategoryLabel)
        self.newsCategoryLabel.constraint(top: self.newsBackgroundView.topAnchor,
                                     leading: self.newsBackgroundView.leadingAnchor,
                                     padding: UIEdgeInsets(top: 16, left: 16, bottom: 0, right: 0))
        self.newsCategoryLabel.constraint(.heightAnchor, constant: Size.categoryLabelHeigth)

        self.addSubview(self.newsTitleLabel)
        self.newsTitleLabel.constraint(top: self.newsCategoryLabel.bottomAnchor,
                                  leading: self.newsBackgroundView.leadingAnchor,
                                  trailing: self.newsBackgroundView.trailingAnchor,
                                  padding: UIEdgeInsets(top: 14, left: 20, bottom: 0, right: 20))
    }

    func setData(_ newsData: News) {
        self.newsTitleLabel.text = newsData.title
        self.newsCategoryLabel.text = newsData.category
    }

    func calculateLabelWidth(_ newsData: News) {
        let label = UILabel()
        label.font = .font(.bold, ofSize: Size.categoryLabelFontSize)
        label.text = newsData.category
        label.sizeToFit()

        self.newsCategoryLabel.constraint(.widthAnchor, constant: label.frame.width + Size.categoryLabelPadding)
    }
}
