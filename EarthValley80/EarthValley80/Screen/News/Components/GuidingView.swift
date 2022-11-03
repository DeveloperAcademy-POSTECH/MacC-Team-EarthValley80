//
//  GuidingView.swift
//  EarthValley80
//
//  Created by SHIN YOON AH on 2022/10/26.
//

import UIKit

final class GuidingView: UIView {

    enum GuideType {
        case scrollGuide
        case touchGuide
        case vocabularyGuide
        case complete
        
        var mainText: String {
            switch self {
            case .scrollGuide:
                return StringLiteral.scrollGuideText
            case .touchGuide:
                return StringLiteral.highlightTopTouchGuideText
            case .vocabularyGuide:
                return StringLiteral.vocabularyGuideText
            case .complete:
                return StringLiteral.completeGuideText
            }
        }
        
        var subText: String? {
            switch self {
            case .touchGuide:
                return StringLiteral.highlightBottomTouchGuideText
            case .vocabularyGuide:
                return StringLiteral.vocabularyGuidesubText
            default:
                return nil
            }
        }
        
        var mainImage: UIImage {
            switch self {
            case .scrollGuide:
                return ImageLiteral.imgCoach1
            case .touchGuide:
                return ImageLiteral.imgCoach
            case .vocabularyGuide:
                return ImageLiteral.imgCoach2
            case .complete:
                return UIImage()
            }
        }
        
        var mainTextLayout: UIEdgeInsets {
            switch self {
            case .scrollGuide:
                return UIEdgeInsets(top: 0, left: 226, bottom: -325, right: 0)
            case .touchGuide:
                return UIEdgeInsets(top: 352, left: 0, bottom: 0, right: -147)
            case .vocabularyGuide:
                return UIEdgeInsets(top: 0, left: 395, bottom: -196, right: 0)
            case .complete:
                return UIEdgeInsets.zero
            }
        }
        
        var subTextLayout: UIEdgeInsets {
            switch self {
            default:
                // TODO: - 뷰가 확정되면 넣어줍니다.
                return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            }
        }
        
        var mainImageLayout: UIEdgeInsets {
            switch self {
            default:
                // TODO: - 뷰가 확정되면 넣어줍니다.
                return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            }
        }
    }
    
    // MARK: - property
    
    private let mainGuideTextLabel: UILabel = {
        let label = UILabel()
        label.font = .font(.medium, ofSize: 16)
        label.textColor = .evyWhite
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var subGuideTextLabel: UILabel = {
        let label = UILabel()
        label.font = .font(.medium, ofSize: 16)
        label.textColor = .evyWhite
        label.numberOfLines = 2
        return label
    }()
    
    private let mainGuideImageView = UIImageView()
    
    // MARK: - init

    init(guidingType: GuideType) {
        super.init(frame: .zero)
        self.setupMainComponent(guidingType: guidingType)
        self.setupSubComponent(guidingType: guidingType)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - func
    
    private func setupMainComponent(guidingType: GuideType) {
        self.addSubview(self.mainGuideTextLabel)
        let mainTextConstraint = self.setupLayout(with: self.mainGuideTextLabel, edgeInset: guidingType.mainTextLayout)
        NSLayoutConstraint.activate(mainTextConstraint)
        self.mainGuideTextLabel.text = guidingType.mainText
        self.mainGuideTextLabel.setLineSpacing(kernValue: -0.3, lineSpacing: 10.0)
        
        self.addSubview(self.mainGuideImageView)
        let mainImageConstraint = self.setupLayout(with: self.mainGuideImageView, edgeInset: guidingType.mainImageLayout)
        NSLayoutConstraint.activate(mainImageConstraint)
        self.mainGuideImageView.image = guidingType.mainImage
    }
    
    private func setupSubComponent(guidingType: GuideType) {
        guard let subText = guidingType.subText else { return }
        
        self.addSubview(self.subGuideTextLabel)
        let subTextConstraint = self.setupLayout(with: self.subGuideTextLabel, edgeInset: guidingType.subTextLayout)
        NSLayoutConstraint.activate(subTextConstraint)
        self.subGuideTextLabel.text = subText
        self.subGuideTextLabel.setLineSpacing(kernValue: -0.3, lineSpacing: 10.0)
    }
    
    private func setupLayout(with subview: UIView, edgeInset: UIEdgeInsets) -> [NSLayoutConstraint] {
        var constraint: [NSLayoutConstraint] = []
        
        if edgeInset.top != 0 {
            let topConstraint = subview.topAnchor.constraint(equalTo: self.topAnchor, constant: edgeInset.top)
            constraint.append(topConstraint)
        }
        
        if edgeInset.left != 0 {
            let leadingConstraint = subview.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: edgeInset.left)
            constraint.append(leadingConstraint)
        }
        
        if edgeInset.bottom != 0 {
            let bottomConstraint = subview.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: edgeInset.bottom)
            constraint.append(bottomConstraint)
        }
        
        if edgeInset.right != 0 {
            let trailingConstraint = subview.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: edgeInset.right)
            constraint.append(trailingConstraint)
        }
        
        return constraint
    }
}
