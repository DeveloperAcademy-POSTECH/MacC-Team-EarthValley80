//
//  QuestionView.swift
//  EarthValley80
//
//  Created by SHIN YOON AH on 2022/10/25.
//

import UIKit

protocol QuestionViewDelegate: AnyObject {
    func questionView(_ questionView: QuestionView, goTo step: QuestionView.Step)
}

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
    
    enum Step {
        case start
        case who
    }
    
    // MARK: - property
    
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
    private lazy var previousButton: UIButton = {
        let button = UIButton(type: .system)
        let action = UIAction { [weak self] _ in
            guard let self = self else { return }
            self.delegate?.questionView(self, goTo: .start)
        }
        button.addAction(action, for: .touchUpInside)
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
    private let questionTitleStackView = QuestionTitleStackView()
    private let nextButton = NextButton(configType: .next)
    
    var captionText: String = "" {
        willSet {
            self.questionTitleStackView.captionLabel.text = newValue
            self.questionTitleStackView.captionLabel.setLineSpacing(kernValue: -0.2)
        }
    }
    
    var titleText: String = "" {
        willSet {
            self.questionTitleStackView.titleLabel.text = newValue
            self.questionTitleStackView.titleLabel.setLineSpacing(kernValue: -0.3)
        }
    }
    
    var placeholder: String = "" {
        willSet {
            self.contentTextView.text = newValue
        }
    }
    
    weak var delegate: QuestionViewDelegate?

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

        self.addSubview(self.questionTitleStackView)
        self.questionTitleStackView.constraint(top: self.topAnchor,
                                               leading: self.leadingAnchor,
                                               trailing: self.trailingAnchor,
                                               padding: UIEdgeInsets(top: 55, left: 0, bottom: 0, right: 0))
        
        self.addSubview(self.contentTextView)
        self.contentTextView.constraint(top: self.questionTitleStackView.bottomAnchor,
                                        leading: self.leadingAnchor,
                                        bottom: self.bottomAnchor,
                                        trailing: self.trailingAnchor,
                                        padding: UIEdgeInsets(top: 40, left: 0, bottom: 130, right: 0))
        
        self.addSubview(self.nextButton)
        self.nextButton.constraint(bottom: self.bottomAnchor,
                                   trailing: self.trailingAnchor,
                                   padding: UIEdgeInsets(top: 0, left: 0, bottom: Size.buttonBottomConstant, right: Size.buttonHorizontalPadding))
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
    
    func setCollectionViewHidden(to isHidden: Bool) {
        self.questionTitleStackView.isHiddenCollectionView = isHidden
    }
}
