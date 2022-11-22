//
//  NewsTitleView.swift
//  EarthValley80
//
//  Created by SHIN YOON AH on 2022/10/25.
//

import UIKit

final class NewsTitleView: UIView {
    
    private enum Size {
        static let leadingSpacing: CGFloat = 50.0
        static let minimumLeadingSpacing: CGFloat = 36.0
        static let trailingSpacing: CGFloat = 60.0
        static let minimumTrailingSpacing: CGFloat = 60.0
        static let originalFontSize: CGFloat = 40.0
        static let minimumFontSize: CGFloat = 28.0
        static let originalBottomSpacing: CGFloat = 62.0
        static let minimumBottomSpacing: CGFloat = 24.0
        static let width: CGFloat = 573.adjustedWidth
        static let titleViewSpacing: CGFloat = 30.0
    }
    
    enum Status {
        case expanded
        case compact
        case scrolled
        
        var fontSize: CGFloat {
            switch self {
            case .compact:
                return Size.minimumFontSize
            default:
                return Size.originalFontSize
            }
        }
        
        var textColor: UIColor {
            switch self {
            case .expanded:
                return .evyWhite
            default:
                return .evyWhite.withAlphaComponent(0.4)
            }
        }
        
        var leadingSpacing: CGFloat {
            switch self {
            case .compact:
                return Size.minimumLeadingSpacing
            default:
                return Size.leadingSpacing
            }
        }

        var trailingSpacing: CGFloat {
            switch self {
            case .compact:
                return Size.minimumTrailingSpacing
            default:
                return Size.trailingSpacing
            }
        }
        
        var bottomSpacing: CGFloat {
            switch self {
            case .compact:
                return Size.minimumBottomSpacing
            default:
                return Size.originalBottomSpacing
            }
        }
        
        var labelWidth: CGFloat {
            let screenWidth: CGFloat = UIScreen.main.bounds.size.width
            switch self {
            case .compact:
                return screenWidth - (self.leadingSpacing + self.trailingSpacing + Size.width + Size.titleViewSpacing)
            default:
                return screenWidth - (self.leadingSpacing + self.trailingSpacing)
            }
        }
    }
    
    // MARK: - property
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        // TODO: - 더미 데이터, 나중에 지우겠습니다.
        label.text = "인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장"
        label.numberOfLines = 0
        label.font = .font(.bold, ofSize: self.status.fontSize)
        label.setLineSpacing(kernValue: -2.0, lineHeightMultiple: 1.16)
        return label
    }()
    
    var status: Status = .expanded {
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
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
                                                          padding: UIEdgeInsets(top: 0, left: self.status.leadingSpacing, bottom: self.status.bottomSpacing, right: self.status.trailingSpacing))
        
        self.labelConstraint?[.bottom]?.isActive = self.status == .compact
    }
    
    private func updateLayout(with status: Status) {
        self.labelConstraint?[.bottom]?.isActive = status == .compact
        
        self.labelConstraint?[.leading]?.constant = status.leadingSpacing
        self.labelConstraint?[.trailing]?.constant = -status.trailingSpacing
        self.labelConstraint?[.bottom]?.constant = -status.bottomSpacing
    }
    
    func updateTitleStatus(to status: Status) {
        self.status = status
        self.updateLayout(with: status)
    }
}
