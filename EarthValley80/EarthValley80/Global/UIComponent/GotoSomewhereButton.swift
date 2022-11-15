//
//  GotoSomewhereButton.swift
//  EarthValley80
//
//  Created by LeeJiSoo on 2022/11/02.
//

import UIKit

final class GotoSomewhereButton: UIButton {

    private enum Size {
        static let buttonContentEdgeIneset: CGFloat = -10.0
        static let buttonFontSize: CGFloat = 16.0
        static let buttonHeigth: CGFloat = 50.0
        static let buttonCornerRadius: CGFloat = 25.0
        static let buttonImageSize: UIImage.SymbolConfiguration = UIImage.SymbolConfiguration(pointSize: 35)
    }

    private enum ButtonColor: String {
        case finishRead = "다읽었어요!"
        case findImportantLine = "중심문장 찾으러 가기"
        case shareArticle = "기사 공유하기"
        case gotoNewsDrawer = "뉴스서랍가기"

        var backgroundColor: UIColor {
            switch self {
            case .shareArticle:
                return .evyWhite2
            default:
                return .evyWhite
            }
        }

        var fontColor: UIColor {
            switch self {
            case .shareArticle:
                return .evyWhite
            default:
                return .evyBlack1
            }
        }
    }

    // MARK: - init

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureUI()
        self.setButtonShadow()
        self.moveImageLeftToRight()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - func

    private func configureUI() {
        if #available(iOS 15.0, *) {
            var buttonConfig = UIButton.Configuration.filled()
            var buttonTitleAttribute = AttributedString()
            buttonTitleAttribute.font = .font(.medium, ofSize: 16)
            buttonConfig.attributedTitle = buttonTitleAttribute
            buttonConfig.titleAlignment = .leading
            buttonConfig.cornerStyle = .capsule
            buttonConfig.preferredSymbolConfigurationForImage = Size.buttonImageSize
            buttonConfig.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 10, bottom: 7, trailing: 30)
            buttonConfig.background.strokeWidth = 1
            buttonConfig.background.strokeColor = .evyWhite
            configuration = buttonConfig
        } else {
            self.invalidateIntrinsicContentSize()
            self.titleLabel?.textAlignment = .center
            self.titleLabel?.setLineSpacing(kernValue: -0.32, lineHeightMultiple: 0.83)
            self.imageView?.contentMode = .scaleAspectFit
            self.constraint(.heightAnchor, constant: Size.buttonHeigth)
            self.contentEdgeInsets = UIEdgeInsets(top: 8, left: 10, bottom: 7, right: 30)
            self.layer.cornerRadius = Size.buttonCornerRadius
            self.layer.borderWidth = 1.0
            self.layer.borderColor = UIColor.evyWhite.cgColor
        }
    }

    private func moveImageLeftToRight() {
        transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        titleLabel?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        imageView?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
    }

    private func setButtonShadow() {
        self.layer.shadowOpacity = 0.4
        self.layer.shadowRadius = 20
        self.layer.shadowOffset = CGSize(width: 4, height: 10)
        self.layer.shadowColor = UIColor.evyBlack1.cgColor
    }

    func changeButtonContents(buttonImage: UIImage, buttonTitle: String) {
        self.setImage(buttonImage, for: .normal)
        self.setTitle(buttonTitle, for: .normal)

        if #available(iOS 15.0, *) {
            self.configuration?.baseForegroundColor = ButtonColor(rawValue: buttonTitle)?.fontColor
            self.configuration?.baseBackgroundColor = ButtonColor(rawValue: buttonTitle)?.backgroundColor
        } else {
            self.setTitleColor(ButtonColor(rawValue: buttonTitle)?.fontColor, for: .normal)
            self.backgroundColor = ButtonColor(rawValue: buttonTitle)?.backgroundColor
        }
    }
}
    }
}
