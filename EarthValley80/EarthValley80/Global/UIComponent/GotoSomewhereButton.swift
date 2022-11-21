//
//  GotoSomewhereButton.swift
//  EarthValley80
//
//  Created by LeeJiSoo on 2022/11/02.
//

import UIKit

final class GotoSomewhereButton: UIButton {

    private enum Size {
        static let buttonFontSize: CGFloat = 16.0
        static let buttonHeigth: CGFloat = 50.0
        static let buttonCornerRadius: CGFloat = 25.0
        static let buttonImageSize: UIImage.SymbolConfiguration = UIImage.SymbolConfiguration(pointSize: 14)
        static let buttonLeadingPadding: CGFloat = 27.63
        static let buttonTrailingPadding: CGFloat = 28
        static let buttonTopAndBottomPadding: CGFloat = 17
        static let buttonStrokeWidth: CGFloat = 1
        static let buttonImageAndTitleInterval: CGFloat = 9.07
    }

    private enum ButtonColor: String {
        case finishReadButtonText = "다읽었어요!"
        case findCentralSentenceButtonText = "중심문장 찾으러 가기"
        case shareArticleButtonText = "기사 공유하기"
        case goToNewsDrawerButtonText = "뉴스서랍가기"

        var backgroundColor: UIColor {
            switch self {
            case .shareArticleButtonText:
                return .transparentWhite
            default:
                return .evyWhite
            }
        }

        var fontColor: UIColor {
            switch self {
            case .shareArticleButtonText:
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
            buttonTitleAttribute.font = .font(.medium, ofSize: Size.buttonFontSize)
            buttonConfig.attributedTitle = buttonTitleAttribute
            buttonConfig.titleAlignment = .leading
            buttonConfig.cornerStyle = .capsule
            buttonConfig.preferredSymbolConfigurationForImage = Size.buttonImageSize
            buttonConfig.contentInsets = NSDirectionalEdgeInsets(top: Size.buttonTopAndBottomPadding,
                                                                 leading: Size.buttonLeadingPadding,
                                                                 bottom: Size.buttonTopAndBottomPadding,
                                                                 trailing: Size.buttonTrailingPadding)
            buttonConfig.background.strokeWidth = Size.buttonStrokeWidth
            buttonConfig.background.strokeColor = .evyWhite
            buttonConfig.imagePadding = 9.07
            configuration = buttonConfig
        } else {
            self.invalidateIntrinsicContentSize()
            self.titleLabel?.textAlignment = .center
            self.titleLabel?.setLineSpacing(kernValue: -0.32, lineHeightMultiple: 0.83)
            self.imageView?.contentMode = .scaleAspectFit
            self.constraint(.heightAnchor, constant: Size.buttonHeigth)
            self.titleEdgeInsets = UIEdgeInsets(top: 0, left: Size.buttonImageAndTitleInterval, bottom: 0, right: 0)
            self.contentEdgeInsets = UIEdgeInsets(top: Size.buttonTopAndBottomPadding,
                                                  left: 0,
                                                  bottom: Size.buttonTopAndBottomPadding,
                                                  right: Size.buttonImageAndTitleInterval)
            self.layer.cornerRadius = Size.buttonCornerRadius
            self.layer.borderWidth = Size.buttonStrokeWidth
            self.layer.borderColor = UIColor.evyWhite.cgColor
        }
    }

    private func moveImageLeftToRight() {
        self.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        self.titleLabel?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        self.imageView?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
    }

    private func calculateButtonWidth(with buttonTitle: String) -> CGFloat {
        let label = UILabel()
        label.text = buttonTitle
        label.font = .font(.bold, ofSize: Size.buttonFontSize)
        label.sizeToFit()
        return label.frame.width + Size.buttonLeadingPadding + Size.buttonTrailingPadding + 34
    }

    func setupButtonContents(buttonImage: UIImage, buttonTitle: String) {
        self.setImage(buttonImage, for: .normal)
        self.setTitle(buttonTitle, for: .normal)
        self.makeButtonShadow(color: .evyBlack1, opacity: 0.4, offset: CGSize(width: 4, height: 10), radius: 20, buttonTitle: buttonTitle, buttonHeight: Size.buttonHeigth)
        if #available(iOS 15.0, *) {
            self.configuration?.baseForegroundColor = ButtonColor(rawValue: buttonTitle)?.fontColor
            self.configuration?.baseBackgroundColor = ButtonColor(rawValue: buttonTitle)?.backgroundColor
        } else {
            self.setTitleColor(ButtonColor(rawValue: buttonTitle)?.fontColor, for: .normal)
            self.backgroundColor = ButtonColor(rawValue: buttonTitle)?.backgroundColor
            self.constraint(.widthAnchor, constant: calculateButtonWidth(with: buttonTitle))
        }
    }
}

private extension UIColor {
    static var transparentWhite: UIColor {
        return UIColor(hex: "#FFFFFF", alpha: 0.14)
    }
}
