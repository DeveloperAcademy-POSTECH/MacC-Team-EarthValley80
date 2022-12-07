//
//  MyNewsDrawerCollectionViewCell.swift
//  EarthValley80
//
//  Created by LeeJiSoo on 2022/12/02.
//

import UIKit

class MyNewsDrawerCollectionViewCell: UICollectionViewCell {

    private enum Size {
        static let standardOfTitle: Int = 30
        static let categoryLabelHeigth: CGFloat = 20.0
        static let categoryCornerRadius: CGFloat = 10.0
        static let newsCardCornerRadius: CGFloat = 30.0
        static let titleFontSize: CGFloat = 18.0
        static let categoryLabelFontSize: CGFloat = 10.0
        static let categoryLabelPadding: CGFloat = 18.0
    }

    private enum CardUI: String {
        case economy = "경제"
        case science = "과학"
        case culture = "문화"
        case society = "시사"

        var background: UIColor {
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

    private let newsCardBackgroundView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = Size.newsCardCornerRadius
        view.layer.borderColor = UIColor.evyGray3.cgColor
        view.layer.borderWidth = 1.0
        view.backgroundColor = .evyWhite
        view.makeShadow(color: .evyBlack1, opacity: 0.08, offset: CGSize(width: 2, height: 8), radius: 18)
        return view
    }()
    private let newsTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .font(.regular, ofSize: Size.titleFontSize)
        label.textColor = .evyBlack1
        return label
    }()
    private let newsCategoryLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .font(.regular, ofSize: Size.categoryLabelFontSize)
        label.textColor = .evyWhite
        label.layer.masksToBounds = true
        label.layer.cornerRadius = Size.categoryCornerRadius
        label.layer.opacity = 0.6
        return label
    }()
    private let emojiImageView: UIImageView = {
        let imageview = UIImageView()
        // TODO: - 저장된 emoji를 불러와야 합니다.
        imageview.image = UIImage(named: "tempEmoji")
        imageview.contentMode = .scaleAspectFit
        return imageview
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
        self.contentView.addSubview(self.newsCardBackgroundView)
        self.newsCardBackgroundView.constraint(to: self)

        self.addSubview(self.newsCategoryLabel)
        self.newsCategoryLabel.constraint(top: self.newsCardBackgroundView.topAnchor,
                                     leading: self.newsCardBackgroundView.leadingAnchor,
                                     padding: UIEdgeInsets(top: 16, left: 16, bottom: 0, right: 0))
        self.newsCategoryLabel.constraint(.heightAnchor, constant: Size.categoryLabelHeigth)

        self.addSubview(self.newsTitleLabel)
        self.newsTitleLabel.constraint(top: self.newsCategoryLabel.bottomAnchor,
                                  leading: self.newsCardBackgroundView.leadingAnchor,
                                  trailing: self.newsCardBackgroundView.trailingAnchor,
                                  padding: UIEdgeInsets(top: 14, left: 20, bottom: 0, right: 20))

        self.addSubview(self.emojiImageView)
        self.emojiImageView.constraint(bottom: self.newsCardBackgroundView.bottomAnchor,
                                       trailing: self.newsCardBackgroundView.trailingAnchor,
                                       padding: UIEdgeInsets(top: 0, left: 0, bottom: 16, right: 12))
        self.emojiImageView.constraint(.widthAnchor, constant: 79.adjustedWidth)
        self.emojiImageView.constraint(.heightAnchor, constant: 51.adjustedHeight)
    }

    func setData(_ newsData: News) {
        self.newsTitleLabel.text = newsData.title
        self.newsCategoryLabel.text = newsData.category
        self.newsCategoryLabel.backgroundColor = CardUI(rawValue: newsData.category ?? "")?.background
    }

    func calculateLabelWidth(_ newsData: News) {
        let label = UILabel()
        label.font = .font(.bold, ofSize: Size.categoryLabelFontSize)
        label.text = newsData.category
        label.sizeToFit()

        self.newsCategoryLabel.constraint(.widthAnchor, constant: label.frame.width + Size.categoryLabelPadding)
    }
}
