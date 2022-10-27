//
//  NewsTitleView.swift
//  EarthValley80
//
//  Created by SHIN YOON AH on 2022/10/25.
//

import UIKit

final class NewsTitleView: UIView {
    
    private enum Size {
        static let horizontalPadding: CGFloat = 96.0
        static let minimumHorizontalPadding: CGFloat = 56.0
        static let originalFontSize: CGFloat = 54.0
        static let minimumFontSize: CGFloat = 40.0
    }
    
    enum Status {
        case expanded
        case compact
        
        var fontSize: CGFloat {
            switch self {
            case .expanded:
                return Size.originalFontSize
            case .compact:
                return Size.minimumFontSize
            }
        }
        
        var horizontalPadding: CGFloat {
            switch self {
            case .expanded:
                return Size.horizontalPadding
            case .compact:
                return Size.minimumHorizontalPadding
            }
        }
    }
    
    // MARK: - property
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        // TODO: - 더미 데이터, 나중에 지우겠습니다.
        label.text = "인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장"
        label.numberOfLines = 0
        label.textColor = .white
        label.font = .font(.bold, ofSize: status.fontSize)
        label.setLineSpacing(kernValue: -2.0, lineHeightMultiple: 1.16)
        return label
    }()
    
    private let status: Status

    // MARK: - init
    
    init(status: Status) {
        self.status = status
        super.init(frame: .zero)
        self.setupLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - func
    
    private func setupLayout() {
        self.addSubview(self.titleLabel)
        self.titleLabel.constraint(to: self,
                                   insets: UIEdgeInsets(top: 0, left: status.horizontalPadding, bottom: -40, right: -status.horizontalPadding))
    }
}
