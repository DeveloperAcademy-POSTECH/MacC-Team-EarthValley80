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
    
    enum EntryPoint {
        case reading
        case fiveWsOneH
        
        var fontSize: CGFloat {
            switch self {
            case .reading:
                return Size.originalFontSize
            case .fiveWsOneH:
                return Size.minimumFontSize
            }
        }
        
        var horizontalPadding: CGFloat {
            switch self {
            case .reading:
                return Size.horizontalPadding
            case .fiveWsOneH:
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
        label.font = .font(.bold, ofSize: entryPoint.fontSize)
        label.setLineSpacing(kernValue: -2.0, lineHeightMultiple: 1.16)
        return label
    }()
    
    private let entryPoint: EntryPoint

    // MARK: - init
    
    init(entryPoint: EntryPoint) {
        self.entryPoint = entryPoint
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
                                   insets: UIEdgeInsets(top: 0, left: entryPoint.horizontalPadding, bottom: -40, right: -entryPoint.horizontalPadding))
    }
}
