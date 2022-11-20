//
//  MainSentenceTableViewCell.swift
//  EarthValley80
//
//  Created by SHIN YOON AH on 2022/11/20.
//

import UIKit

final class MainSentenceTableViewCell: UITableViewCell {

    private enum Size {
        static let horizontalSpacing: CGFloat = 34.0
        static let contentInset: CGFloat = 10.0
    }

    // MARK: - property

    private let captionLabel: UILabel = {
        let label = UILabel()
        label.font = .font(.regular, ofSize: 14)
        // TODO: - 컬러셋이 나오면 제대로 적용하겠습니다.
        label.textColor = .evyGray1
        return label
    }()
    private let contentBackgroundView: UIView = {
        let view = UIView()
        // TODO: - 컬러셋이 나오면 제대로 적용하겠습니다.
        view.backgroundColor = .evyGray1
        view.layer.cornerRadius = 13.0
        return view
    }()
    private let contentLabel: UILabel = {
        let label = UILabel()
        label.font = .font(.bold, ofSize: 20)
        // TODO: - 컬러셋이 나오면 제대로 적용하겠습니다.
        label.textColor = .evyBlack2
        label.numberOfLines = 0
        return label
    }()

    // MARK: - init

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupLayout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - func

    private func setupLayout() {
        self.addSubview(self.captionLabel)
        self.captionLabel.constraint(top: self.topAnchor,
                                     leading: self.leadingAnchor,
                                     padding: UIEdgeInsets(top: 30, left: Size.horizontalSpacing, bottom: 0, right: 0))

        self.addSubview(self.contentBackgroundView)
        self.contentBackgroundView.constraint(top: self.captionLabel.bottomAnchor,
                                              leading: self.leadingAnchor,
                                              bottom: self.bottomAnchor,
                                              trailing: self.trailingAnchor,
                                              padding: UIEdgeInsets(top: 14, left: Size.horizontalSpacing, bottom: 0, right: Size.horizontalSpacing))

        self.contentBackgroundView.addSubview(self.contentLabel)
        self.contentLabel.constraint(to: self.contentBackgroundView,
                                     insets: UIEdgeInsets(top: Size.contentInset, left: Size.contentInset, bottom: -Size.contentInset, right: -Size.contentInset))
    }
}
