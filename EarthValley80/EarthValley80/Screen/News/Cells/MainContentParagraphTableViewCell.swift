//
//  MainContentParagraphTableViewCell.swift
//  EarthValley80
//
//  Created by SHIN YOON AH on 2022/11/21.
//

import UIKit

private extension UIColor {
    static var compactTextColor: UIColor {
        return .white.withAlphaComponent(0.8)
    }
}

final class MainContentParagraphTableViewCell: UITableViewCell {

    private enum Size {
        static let horizontalPadding: CGFloat = 50.0
        static let minimumFontSize: CGFloat = 20.0
        static let minimumLineHeightMultiple: CGFloat = 1.5
    }

    // MARK: - property

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
        
    }

    private func configureUI() {
        self.backgroundColor = .clear
        self.selectionStyle = .none
    }
}
