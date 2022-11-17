//
//  GuidingView.swift
//  EarthValley80
//
//  Created by SHIN YOON AH on 2022/10/26.
//

import UIKit

import Lottie

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
                return "\(StringLiteral.hightlightGuideCaptionText)\n\(StringLiteral.highlightBottomTouchGuideText)"
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
                return UIEdgeInsets(top: 250, left: 0, bottom: 0, right: -147)
            case .vocabularyGuide:
                return UIEdgeInsets(top: 0, left: 220, bottom: -199, right: 0)
            case .complete:
                return UIEdgeInsets(top: 0, left: UIScreen.main.bounds.size.width/2 - 90, bottom: -194, right: 0)
            }
        }
        
        var subTextLayout: UIEdgeInsets {
            switch self {
            case .touchGuide:
                return UIEdgeInsets(top: 494, left: 0, bottom: 0, right: -147)
            case .vocabularyGuide:
                return UIEdgeInsets(top: 0, left: 496, bottom: -345, right: 0)
            default:
                return UIEdgeInsets.zero
            }
        }
        
        var mainImageLayout: UIEdgeInsets {
            switch self {
            case .scrollGuide:
                return UIEdgeInsets(top: 0, left: 123, bottom: -206, right: 0)
            case .touchGuide:
                return UIEdgeInsets(top: 178, left: 0, bottom: 0, right: -130)
            case .vocabularyGuide:
                return UIEdgeInsets(top: 0, left: 395, bottom: -196, right: 0)
            default:
                return UIEdgeInsets.zero
            }
        }
    }
    
    // MARK: - property
    
    private let mainGuideTextLabel: UILabel = {
        let label = UILabel()
        label.font = .font(.bold, ofSize: 16)
        label.textColor = .evyWhite
        label.numberOfLines = 0
        return label
    }()
    private lazy var subGuideTextLabel: UILabel = {
        let label = UILabel()
        label.font = .font(.bold, ofSize: 16)
        label.textColor = .evyWhite
        label.numberOfLines = 0
        return label
    }()
    private let clapImageView: UIImageView = UIImageView(image: ImageLiteral.imgClap)
    private let mainGuideImageView = UIImageView()
    
    // MARK: - init

    init(guidingType: GuideType) {
        super.init(frame: .zero)
        self.setupMainComponentLayout(guidingType: guidingType)
        self.setupMainComponentConfiguration(guidingType: guidingType)
        self.setupSubComponentLayout(guidingType: guidingType)
        self.setupSubComponentConfiguration(guidingType: guidingType)
        self.setupLottieView(guidingType: guidingType)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        self.clapImageView.removeFromSuperview()
    }
    
    // MARK: - func
    
    private func setupMainComponentLayout(guidingType: GuideType) {
        self.addSubview(self.mainGuideTextLabel)
        self.mainGuideTextLabel.translatesAutoresizingMaskIntoConstraints = false
        self.setupLayout(with: self.mainGuideTextLabel, edgeInset: guidingType.mainTextLayout)
        
        self.addSubview(self.mainGuideImageView)
        self.mainGuideImageView.translatesAutoresizingMaskIntoConstraints = false
        self.setupLayout(with: self.mainGuideImageView, edgeInset: guidingType.mainImageLayout)
    }
    
    private func setupMainComponentConfiguration(guidingType: GuideType) {
        self.mainGuideTextLabel.text = guidingType.mainText
        self.mainGuideTextLabel.applyColor(to: guidingType.captionText, with: .evyWhite.withAlphaComponent(0.3))
        self.mainGuideTextLabel.applyFont(to: guidingType.captionText, with: .font(.bold, ofSize: 12))
        self.mainGuideTextLabel.setLineSpacing(kernValue: -0.3, lineSpacing: 10.0)
        self.mainGuideTextLabel.textAlignment = guidingType.textAlignment
        
        self.mainGuideImageView.image = guidingType.mainImage
    }
    
    private func setupSubComponentLayout(guidingType: GuideType) {
        guard guidingType.subText != nil else { return }
        
        self.addSubview(self.subGuideTextLabel)
        self.subGuideTextLabel.translatesAutoresizingMaskIntoConstraints = false
        self.setupLayout(with: self.subGuideTextLabel, edgeInset: guidingType.subTextLayout)
    }
    
    private func setupSubComponentConfiguration(guidingType: GuideType) {
        guard let subText = guidingType.subText else { return }
        
        self.subGuideTextLabel.text = subText
        
        if guidingType == .touchGuide {
            self.subGuideTextLabel.applyColor(to: guidingType.captionText, with: .evyWhite.withAlphaComponent(0.3))
            self.subGuideTextLabel.applyFont(to: guidingType.captionText, with: .font(.bold, ofSize: 12))
        } else {
            self.subGuideTextLabel.textColor = .evyWhite.withAlphaComponent(0.2)
            self.subGuideTextLabel.applyColor(to: "단어", with: .evyWhite)
            self.subGuideTextLabel.applyFont(to: guidingType.subText ?? "", with: .font(.bold, ofSize: 20))
        }
        
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
    
    private func setupLottieView(guidingType: GuideType) {
        guard guidingType == .complete else { return }
        
        self.clapImageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.clapImageView)
        self.clapImageView.constraint(top: self.topAnchor,
                                      centerX: self.centerXAnchor,
                                      padding: UIEdgeInsets(top: 156, left: 0, bottom: 0, right: 0))
        self.clapImageView.constraint(.widthAnchor, constant: 640)
        self.clapImageView.constraint(.heightAnchor, constant: 446)
    }
}
