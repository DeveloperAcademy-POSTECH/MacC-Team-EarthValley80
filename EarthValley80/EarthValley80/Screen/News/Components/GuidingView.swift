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
                return "\(StringLiteral.scrollGuideCaptionText)\n\(StringLiteral.scrollGuideText)"
            case .touchGuide:
                return "\(StringLiteral.hightlightGuideCaptionText)\n\(StringLiteral.highlightTopTouchGuideText)"
            case .vocabularyGuide:
                return "\(StringLiteral.vocabularyGuideCaptionText)\n\(StringLiteral.vocabularyGuideText)"
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
        
        var captionText: String {
            switch self {
            case .scrollGuide:
                return StringLiteral.scrollGuideCaptionText
            case .touchGuide:
                return StringLiteral.hightlightGuideCaptionText
            case .vocabularyGuide:
                return StringLiteral.vocabularyGuideCaptionText
            case .complete:
                return ""
            }
        }
        
        var textAlignment: NSTextAlignment {
            switch self {
            case .touchGuide:
                return .right
            case .complete:
                return .center
            default:
                return .left
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
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var subGuideTextLabel: UILabel = {
        let label = UILabel()
        label.font = .font(.medium, ofSize: 16)
        label.textColor = .evyWhite
        label.numberOfLines = 0
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
        self.mainGuideTextLabel.translatesAutoresizingMaskIntoConstraints = false
        self.setupLayout(with: self.mainGuideTextLabel, edgeInset: guidingType.mainTextLayout)
        
        self.mainGuideTextLabel.text = guidingType.mainText
        self.mainGuideTextLabel.applyColor(to: guidingType.captionText, with: .evyWhite.withAlphaComponent(0.3))
        self.mainGuideTextLabel.applyFont(to: guidingType.captionText, with: .font(.medium, ofSize: 12))
        self.mainGuideTextLabel.setLineSpacing(kernValue: -0.3, lineSpacing: 10.0)
        self.mainGuideTextLabel.textAlignment = guidingType.textAlignment
        
        self.addSubview(self.mainGuideImageView)
        self.mainGuideImageView.translatesAutoresizingMaskIntoConstraints = false
        self.setupLayout(with: self.mainGuideImageView, edgeInset: guidingType.mainImageLayout)
        
        self.mainGuideImageView.image = guidingType.mainImage
    }
    
    private func setupSubComponent(guidingType: GuideType) {
        guard let subText = guidingType.subText else { return }
        
        self.addSubview(self.subGuideTextLabel)
        self.subGuideTextLabel.translatesAutoresizingMaskIntoConstraints = false
        self.setupLayout(with: self.subGuideTextLabel, edgeInset: guidingType.subTextLayout)
        
        self.subGuideTextLabel.text = subText
        self.subGuideTextLabel.setLineSpacing(kernValue: -0.3, lineSpacing: 10.0)
        self.subGuideTextLabel.textAlignment = guidingType.textAlignment
    }
    
    private func setupLayout(with subview: UIView, edgeInset: UIEdgeInsets) {
        if edgeInset.top != 0 {
            subview.topAnchor.constraint(equalTo: self.topAnchor, constant: edgeInset.top).isActive = true
        }
        
        if edgeInset.left != 0 {
            subview.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: edgeInset.left).isActive = true
        }
        
        if edgeInset.bottom != 0 {
            subview.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: edgeInset.bottom).isActive = true
        }
        
        if edgeInset.right != 0 {
            subview.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: edgeInset.right).isActive = true
        }
    }
}
