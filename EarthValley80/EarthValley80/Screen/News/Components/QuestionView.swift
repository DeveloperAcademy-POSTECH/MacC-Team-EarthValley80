//
//  QuestionView.swift
//  EarthValley80
//
//  Created by SHIN YOON AH on 2022/10/25.
//

import UIKit

final class QuestionView: UIView {
    
    private enum Size {
        static let height: CGFloat = UIScreen.main.bounds.size.height - 32.0
        static let width: CGFloat = UIScreen.main.bounds.size.width * 0.48
        static let buttonBottomConstant: CGFloat = 21.0
        static let buttonHorizontalPadding: CGFloat = 30.0
        static let buttonSize: CGFloat = 60.0
    }
    
    enum TextMode {
        case beforeWriting
        case write
        case complete
        
        var textColor: UIColor {
            switch self {
            case .beforeWriting:
                return .tertiaryLabel
            default:
                return .black
            }
        }
    }
    
    // MARK: - property
    
    private let captionLabel: UILabel = {
        let label = UILabel()
        label.font = .font(.bold, ofSize: 12)
        label.lineBreakStrategy = .hangulWordPriority
        // TODO: - 색상이 확정되면 추가
        label.textColor = .lightGray
        return label
    }()
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .font(.bold, ofSize: 20)
        // TODO: - 색상이 확정되면 추가
        label.textColor = .black
        return label
    }()
    private lazy var contentTextView: UITextView = {
        let textView = UITextView()
        textView.textContainer.lineBreakMode = .byCharWrapping
        textView.setTypingAttributes(lineSpacing: 10.0)
        textView.font = .font(.bold, ofSize: 40)
        // TODO: - 색상이 확정되면 추가
        textView.tintColor = .black
        textView.textContainerInset = UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 83)
        return textView
    }()
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = .font(.medium, ofSize: 12)
        // TODO: - 색상이 확정되면 추가
        button.tintColor = .black
        button.setTitleColor(.black, for: .normal)
        button.semanticContentAttribute = .forceRightToLeft
        button.setTitle(StringLiteral.nextButtonText, for: .normal)
        button.setImage(ImageLiteral.icArrowRight, for: .normal)
        button.setPreferredSymbolConfiguration(.init(pointSize: 20, weight: .regular, scale: .large), forImageIn: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        return button
    }()
    private let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .black
        button.setImage(ImageLiteral.icArrowLeft, for: .normal)
        button.setPreferredSymbolConfiguration(.init(pointSize: 20, weight: .regular, scale: .large), forImageIn: .normal)
        return button
    }()
    private var textMode: TextMode = .beforeWriting {
        willSet {
            switch newValue {
            case .beforeWriting:
                self.applyTextViewConfiguration(with: newValue, placeholder: self.placeholder)
            case .write:
                self.applyTextViewConfiguration(with: newValue, placeholder: "")
            case .complete:
                break
            }
        }
    }
    
    var captionText: String = "" {
        willSet {
            self.captionLabel.text = newValue
            self.captionLabel.setLineSpacing(kernValue: -0.2)
        }
    }
    
    var titleText: String = "" {
        willSet {
            self.titleLabel.text = newValue
            self.titleLabel.setLineSpacing(kernValue: -0.3)
        }
    }
    
    var placeholder: String = "" {
        willSet {
            self.contentTextView.text = newValue
        }
    }

    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupLayout()
        self.configureUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - func
    
    private func setupLayout() {
        self.constraint(.heightAnchor, constant: Size.height)
        self.constraint(.widthAnchor, constant: Size.width)
        
        self.addSubview(self.captionLabel)
        self.captionLabel.constraint(top: self.topAnchor,
                                     leading: self.leadingAnchor,
                                     padding: UIEdgeInsets(top: 52, left: 40, bottom: 0, right: 0))
        
        self.addSubview(self.titleLabel)
        self.titleLabel.constraint(top: self.captionLabel.bottomAnchor,
                                   leading: self.leadingAnchor,
                                   padding: UIEdgeInsets(top: 10, left: 40, bottom: 0, right: 0))
        
        self.addSubview(self.contentTextView)
        self.contentTextView.constraint(top: self.titleLabel.bottomAnchor,
                                        leading: self.leadingAnchor,
                                        bottom: self.bottomAnchor,
                                        trailing: self.trailingAnchor,
                                        padding: UIEdgeInsets(top: 40, left: 0, bottom: 130, right: 0))
        
        self.addSubview(self.nextButton)
        self.nextButton.constraint(bottom: self.bottomAnchor,
                                   trailing: self.trailingAnchor,
                                   padding: UIEdgeInsets(top: 0, left: 0, bottom: Size.buttonBottomConstant, right: Size.buttonHorizontalPadding))
        self.nextButton.constraint(.heightAnchor, constant: Size.buttonSize)
        self.nextButton.constraint(.widthAnchor, constant: 104)
        
        self.addSubview(self.previousButton)
        self.previousButton.constraint(leading: self.leadingAnchor,
                                       bottom: self.bottomAnchor,
                                       padding: UIEdgeInsets(top: 0, left: Size.buttonHorizontalPadding, bottom: Size.buttonBottomConstant, right: 0))
        self.previousButton.constraint(.widthAnchor, constant: Size.buttonSize)
        self.previousButton.constraint(.heightAnchor, constant: Size.buttonSize)
    }
    
    private func configureUI() {
        self.backgroundColor = .white
        self.layer.cornerRadius = 30
        
        self.textMode = .beforeWriting
    }
    
    private func applyTextViewConfiguration(with state: TextMode, placeholder: String) {
        self.contentTextView.text = placeholder
        self.contentTextView.textColor = state.textColor
    }
}
