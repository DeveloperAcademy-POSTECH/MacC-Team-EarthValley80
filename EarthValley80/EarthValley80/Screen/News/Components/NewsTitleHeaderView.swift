//
//  NewsTitleHeaderView.swift
//  EarthValley80
//
//  Created by SHIN YOON AH on 2022/10/25.
//

import UIKit

final class NewsTitleHeaderView: UIView {
    
    private enum Size {
        static let horizontalPadding: CGFloat = 96.0
        static let originalFontSize: CGFloat = 54.0
        static let minimumFontSize: CGFloat = 40.0
    }
    
    // MARK: - property
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장"
        label.numberOfLines = 0
        label.textColor = .white
        label.font = .systemFont(ofSize: Size.originalFontSize, weight: .bold)
        return label
    }()

    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - func
    
    private func setupLayout() {
        self.addSubview(titleLabel)
        titleLabel.constraint(top: self.topAnchor,
                              leading: self.leadingAnchor,
                              bottom: self.bottomAnchor,
                              trailing: self.trailingAnchor,
                              padding: UIEdgeInsets(top: 0, left: Size.horizontalPadding, bottom: 40, right: Size.horizontalPadding))
    }
    
}
