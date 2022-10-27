//
//  NextButton.swift
//  EarthValley80
//
//  Created by SHIN YOON AH on 2022/10/27.
//

import UIKit

final class NextButton: UIButton {
    
    enum ConfigType {
        case next
        case summarize
        case complete
        case disabled
        
        var title: String? {
            switch self {
            case .next:
                return StringLiteral.nextButtonText
            case .summarize:
                return StringLiteral.summarizeButtonText
            case .complete:
                return StringLiteral.completeButtonText
            case .disabled:
                return nil
            }
        }
        
        var color: UIColor {
            switch self {
            case .disabled:
                return .evyGray2
            default:
                return .evyBlack1
            }
        }
        
        var canPress: Bool {
            switch self {
            case .disabled:
                return false
            default:
                return true
            }
        }
    }

    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.setupLayout()
        self.configureUI()
    }
    
    convenience init(configType: ConfigType, buttonType: UIButton.ButtonType = .system) {
        self.init(type: buttonType)
        self.setCustomAttribute(type: configType)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - func
    
    private func setupLayout() {
        self.constraint(.heightAnchor, constant: 60.0)
    }
    
    private func configureUI() {
        self.semanticContentAttribute = .forceRightToLeft
        self.setImage(ImageLiteral.icArrowRight, for: .normal)
        self.setPreferredSymbolConfiguration(.init(pointSize: 20, weight: .regular, scale: .large), forImageIn: .normal)
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
    }
    
    private func setCustomAttribute(type: ConfigType) {
        self.isEnabled = type.canPress
        
        self.tintColor = type.color
        self.setTitleColor(type.color, for: .normal)
        
        if let title = type.title {
            self.setTitle(title, for: .normal)
            self.titleLabel?.font = .font(.medium, ofSize: 12)
        }
    }
}
