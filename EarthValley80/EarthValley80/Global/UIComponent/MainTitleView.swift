//
//  MainTitleView.swift
//  EarthValley80
//
//  Created by LeeJiSoo on 2022/10/27.
//

import UIKit

final class MainTitleView: UIView {

    private enum Size {
        static let yomojomoTitleLabelSize: CGFloat = 40.0
    }

    // MARK: - view
    
    let dateLabel: UILabel = {
        let dateLabel = UILabel()
        dateLabel.text = Date().dateFormatted("EEEE, MMM d")
        dateLabel.font = .font(.bold, ofSize: 13)
        dateLabel.textColor = .evyBlack2
        dateLabel.setLineSpacing(kernValue: 0.39, lineSpacing: 13)
        return dateLabel
    }()
    let yomojomoTitleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = .font(.bold, ofSize: 40)
        titleLabel.textColor = .evyBlack1
        return titleLabel
    }()
    let titleDescriptionLabel: UILabel = {
        let titleDescriptionLabel = UILabel()
        titleDescriptionLabel.textColor = .evyGray1
        return titleDescriptionLabel
    }()

    // MARK: - init

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupLayout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // MARK: - func

    private func setupLayout() {
        self.addSubview(dateLabel)
        self.dateLabel.constraint(top: self.topAnchor,
                                  leading: self.leadingAnchor,
                                  padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))

        self.addSubview(yomojomoTitleLabel)
        self.yomojomoTitleLabel.constraint(top: self.dateLabel.bottomAnchor,
                                           leading: self.dateLabel.leadingAnchor,
                                           padding: UIEdgeInsets(top: 23, left: 0, bottom: 0, right: 0))

        self.addSubview(titleDescriptionLabel)
        self.titleDescriptionLabel.constraint(top: self.yomojomoTitleLabel.bottomAnchor,
                                              leading: self.dateLabel.leadingAnchor,
                                              bottom: self.bottomAnchor,
                                              padding: UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0))
    }
}
