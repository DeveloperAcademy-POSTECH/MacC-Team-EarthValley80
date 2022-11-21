//
//  MainContentParagraphTableViewCell.swift
//  EarthValley80
//
//  Created by SHIN YOON AH on 2022/11/21.
//

import UIKit

private extension UIColor {
    static var compactTextColor: UIColor {
        return .white.withAlphaComponent(0.14)
    }

    static var highlightTextColor: UIColor {
        return .white
    }
}

final class MainContentParagraphTableViewCell: UITableViewCell {

    private enum Size {
        static let horizontalPadding: CGFloat = 50.0
        static let minimumFontSize: CGFloat = 20.0
        static let minimumLineHeightMultiple: CGFloat = 1.5
    }

    // MARK: - property

    private let captionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .compactTextColor
        label.font = .font(.regular, ofSize: 8)
        return label
    }()
    private let contentLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .compactTextColor
        label.font = .font(.regular, ofSize: Size.minimumFontSize)
        return label
    }()

    // MARK: - init

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupLayout()
        self.configureUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - func

    private func setupLayout() {
        self.contentView.addSubview(self.contentLabel)
        self.contentLabel.constraint(top: self.contentView.topAnchor,
                                     leading: self.contentView.leadingAnchor,
                                     bottom: self.contentView.bottomAnchor,
                                     trailing: self.contentView.trailingAnchor,
                                     padding: UIEdgeInsets(top: 0, left: Size.horizontalPadding, bottom: 42, right: Size.horizontalPadding))

        self.contentView.addSubview(self.captionLabel)
        self.captionLabel.constraint(top: self.contentView.topAnchor,
                                     leading: self.contentView.leadingAnchor,
                                     padding: UIEdgeInsets(top: 14, left: Size.horizontalPadding + 17, bottom: 0, right: 0))
    }

    private func configureUI() {
        self.backgroundColor = .clear
        self.selectionStyle = .none
    }

    func setupContentParagraphData(paragraphIndex: Int, content: String) {
        self.captionLabel.text = paragraphIndex.description
        self.contentLabel.text = content
        self.contentLabel.setLineSpacing(kernValue: -2.0,
                                         lineHeightMultiple: Size.minimumLineHeightMultiple)
    }
}
