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
            default:
                return UIImage()
            }
        }
        
        var subImage: UIImage? {
            switch self {
            default:
                return UIImage()
            }
        }
        
        var mainTextLayout: UIEdgeInsets {
            switch self {
            default:
                // TODO: - 뷰가 확정되면 넣어줍니다.
                return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
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
        
        var subImageLayout: UIEdgeInsets {
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
    private let subGuideImageView = UIImageView()
    
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
        self.mainGuideTextLabel.constraint(to: self, insets: guidingType.mainTextLayout)
        self.mainGuideTextLabel.text = guideType.mainText
        
        self.addSubview(self.mainGuideImageView)
        self.mainGuideImageView.constraint(to: self, insets: guidingType.mainImageLayout)
        self.mainGuideImageView.image = guidingType.mainImage
    }
    
    private func setupSubComponent(guidingType: GuideType) {
        guard let subText = guidingType.subText else { return }
        
        self.addSubview(self.subGuideTextLabel)
        self.subGuideTextLabel.constraint(to: self, insets: guidingType.subTextLayout)
        self.subGuideTextLabel.text = subText
        
        guard let subImage = guidingType.subImage else { return }
        
        self.addSubview(self.subGuideImageView)
        self.subGuideImageView.constraint(to: self, insets: guidingType.subImageLayout)
        self.subGuideImageView.image = guidingType.subImage
    }
}
