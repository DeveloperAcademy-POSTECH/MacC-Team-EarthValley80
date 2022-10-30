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
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.text = Date().dateFormatted("EEEE, MMM d")
        label.font = .font(.bold, ofSize: 13)
        label.textColor = .evyBlack2
        label.setLineSpacing(kernValue: 0.39, lineSpacing: 13)
        return label
    }()
    private let yomojomoTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .font(.bold, ofSize: 40)
        label.textColor = .evyBlack1
        label.setLineSpacing(kernValue: -2.4, lineSpacing: 40.0)
        return label
    }()
    private let titleDescriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .evyGray1
        label.setLineSpacing(kernValue: -0.64, lineSpacing: 16.0)
        return label
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
        self.addSubview(self.dateLabel)
        self.dateLabel.constraint(top: self.topAnchor,
                                  leading: self.leadingAnchor,
                                  padding: UIEdgeInsets.zero)

        self.addSubview(self.yomojomoTitleLabel)
        self.yomojomoTitleLabel.constraint(top: self.dateLabel.bottomAnchor,
                                           leading: self.dateLabel.leadingAnchor,
                                           padding: UIEdgeInsets(top: 23, left: 0, bottom: 0, right: 0))

        self.addSubview(self.titleDescriptionLabel)
        self.titleDescriptionLabel.constraint(top: self.yomojomoTitleLabel.bottomAnchor,
                                              leading: self.dateLabel.leadingAnchor,
                                              bottom: self.bottomAnchor,
                                              padding: UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0))
    }

    func changeLabelText(date: String, title: String, description: String) {
        self.dateLabel.text = date
        self.yomojomoTitleLabel.text = title
        self.titleDescriptionLabel.text = description
    }
}
