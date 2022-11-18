//
//  NewsTitleView.swift
//  EarthValley80
//
//  Created by SHIN YOON AH on 2022/10/25.
//

import UIKit

final class NewsTitleView: UIView {
    
    private enum Size {
        static let horizontalPadding: CGFloat = 50.0
        static let minimumHorizontalPadding: CGFloat = 56.0
        static let originalFontSize: CGFloat = 54.0
        static let minimumFontSize: CGFloat = 40.0
        static let questionViewPadding: CGFloat = 16.0
        static let originalBottomSpacing: CGFloat = 50.0
        static let scrolledBottomSpacing: CGFloat = 40.0
        static let minimumBottomSpacing: CGFloat = 24.0
        static let questionViewFrameWidth: CGFloat = UIScreen.main.bounds.size.width * 0.48
    }
    
    enum Status {
        case expanded
        case compact
        case scrolled
        
        var fontSize: CGFloat {
            switch self {
            case .expanded:
                return Size.originalFontSize
            default:
                return Size.minimumFontSize
            }
        }
        
        var textColor: UIColor {
            switch self {
            case .scrolled:
                return .evyWhite.withAlphaComponent(0.4)
            default:
                return .evyWhite
            }
        }
        
        var horizontalPadding: CGFloat {
            switch self {
            case .compact:
                return Size.minimumHorizontalPadding
            default:
                return Size.horizontalPadding
            }
        }
        
        var bottomSpacing: CGFloat {
            switch self {
            case .expanded:
                return Size.originalBottomSpacing
            case .scrolled:
                return Size.scrolledBottomSpacing
            case .compact:
                return Size.minimumBottomSpacing
            }
        }
        
        var labelWidth: CGFloat {
            switch self {
            case .compact:
                return UIScreen.main.bounds.size.width - Size.questionViewFrameWidth - (self.horizontalPadding * 2)
            default:
                return UIScreen.main.bounds.size.width - 20 - (self.horizontalPadding * 2)
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
        label.font = .font(.bold, ofSize: self.status.fontSize)
        label.setLineSpacing(kernValue: -2.0, lineHeightMultiple: 1.16)
        return label
    }()
    
    private(set) var status: Status {
        willSet {
            self.titleLabel.font = .font(.bold, ofSize: newValue.fontSize)
            self.titleLabel.textColor = newValue.textColor
        }
    }
    
    private var labelConstraint: [ConstraintType: NSLayoutConstraint]?
    
    var heightOfLabel: CGFloat {
        let label = UILabel(frame: CGRect(origin: .zero,
                                          size: CGSize(width: self.status.labelWidth, height: CGFloat.greatestFiniteMagnitude)))
        let text = self.titleLabel.text
        
        label.text = text
        label.numberOfLines = 0
        label.font = .font(.bold, ofSize: self.status.fontSize)
        label.setLineSpacing(kernValue: -2.0, lineHeightMultiple: 1.16)
        label.sizeToFit()
        
        return label.frame.height + self.status.bottomSpacing
    }
    
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
        self.labelConstraint = self.titleLabel.constraint(top: self.topAnchor,
                                                          leading: self.leadingAnchor,
                                                          bottom: self.bottomAnchor,
                                                          trailing: self.trailingAnchor,
                                                          padding: UIEdgeInsets(top: 0, left: self.status.horizontalPadding, bottom: self.status.bottomSpacing, right: self.status.horizontalPadding))
        
        self.labelConstraint?[.bottom]?.isActive = self.status == .compact
    }
    
    private func updateLayout(with status: Status) {
        self.labelConstraint?[.bottom]?.isActive = status == .compact
        
        self.labelConstraint?[.leading]?.constant = status.horizontalPadding
        self.labelConstraint?[.trailing]?.constant = -status.horizontalPadding
        self.labelConstraint?[.bottom]?.constant = -status.bottomSpacing
    }
    
    func updateTitleStatus(to status: Status) {
        self.status = status
        self.updateLayout(with: status)
    }
}
