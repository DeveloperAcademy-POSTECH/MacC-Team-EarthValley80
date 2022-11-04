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
                return .evyGray3
            default:
                return .evyBlack1
            }
        }
    }
    
    enum Step: Int, CaseIterable {
        case infer = -2
        case reading = -1
        case who = 0
        case when = 1
        case `where` = 2
        case what = 3
        case how = 4
        case why = 5
        
        var previousButtonIsHidden: Bool {
            switch self {
            case .infer:
                return true
            default:
                return false
            }
        }
        
        var collectionViewIsHidden: Bool {
            switch self {
            case .infer, .reading, .who:
                return true
            default:
                return false
            }
        }
        
        var captionText: String {
            switch self {
            case .infer:
                return StringLiteral.inferringNewsCaptionTitle
            case .who:
                return StringLiteral.answerWhoCaptionTitle
            case .when:
                return StringLiteral.answerWhenCaptionTitle
            case .where:
                return StringLiteral.answerWhereCaptionTitle
            case .what:
                return StringLiteral.answerWhatCaptionTitle
            case .how:
                return StringLiteral.answerHowCaptionTitle
            case .why:
                return StringLiteral.answerWhyCaptionTitle
            case .reading:
                return StringLiteral.answerWhoCaptionTitle
            }
        }
        
        var placeholder: String {
            switch self {
            case .infer:
                return StringLiteral.inferringPlaceholder
            case .who:
                return StringLiteral.answerWhoPlaceholder
            case .when:
                return StringLiteral.answerWhenPlaceholder
            case .where:
                return StringLiteral.answerWherePlaceholder
            case .what:
                return StringLiteral.answerWhatPlaceholder
            case .how:
                return StringLiteral.answerHowPlaceholder
            case .why:
                return StringLiteral.answerWhyPlaceholder
            case .reading:
                return StringLiteral.answerWhoPlaceholder
            }
        }
    }
    
    // MARK: - property
    
    private lazy var contentTextView: UITextView = {
        let textView = UITextView()
        textView.textContainer.lineBreakMode = .byCharWrapping
        textView.setTypingAttributes(lineSpacing: 10.0)
        textView.font = .font(.bold, ofSize: 40)
        textView.tintColor = .evyBlack1
        textView.textContainerInset = UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 83)
        textView.delegate = self
        return textView
    }()
    private lazy var previousButton: UIButton = {
        let button = UIButton(type: .system)
        let action = UIAction { [weak self] _ in
            guard let self = self else { return }
            self.delegate?.questionView(self, goTo: .reading)
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
    private let nextButton = NextButton(configType: .disabled)
    
    private var captionText: String = "" {
        willSet {
            self.questionTitleStackView.captionLabel.text = newValue
            self.questionTitleStackView.captionLabel.setLineSpacing(kernValue: -0.2)
        }
    }
    
    private var titleText: String = "" {
        willSet {
            self.questionTitleStackView.titleLabel.text = newValue
            self.questionTitleStackView.titleLabel.setLineSpacing(kernValue: -0.3)
        }
    }
    
    private var placeholder: String = "" {
        willSet {
            self.contentTextView.text = newValue
        }
    }
    
    private(set) var step: Step = .infer
    
    var questions: [String]? {
        willSet {
            self.titleText = newValue?.first ?? ""
        }
    }
    weak var delegate: QuestionViewDelegate?

    // MARK: - init
    
    init(step: Step) {
        super.init(frame: .zero)
        self.setupLayout()
        self.configureUI()
        self.updateConfiguration(with: step)
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
    
    func updateConfiguration(with step: Step) {
        self.step = step
        
        self.previousButton.isHidden = step.previousButtonIsHidden
        self.questionTitleStackView.isHiddenCollectionView = step.collectionViewIsHidden
        
        self.captionText = step.captionText
        self.placeholder = step.placeholder
        self.titleText = self.questions?[step.rawValue] ?? ""
    }
    
    func setupNextAction(_ action: UIAction) {
        self.nextButton.addAction(action, for: .touchUpInside)
    }
}

// MARK: - UITextViewDelegate
extension QuestionView: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == self.placeholder {
            textView.text = nil
        }
        
        self.textMode = .write
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text == "" {
            textView.text = self.placeholder
            self.textMode = .beforeWriting
            return
        }
        
        self.textMode = .complete
    }
    
    func textViewDidChangeSelection(_ textView: UITextView) {
        guard self.textMode != .beforeWriting else { return }
        
        self.nextButton.configType = textView.hasText ? .next : .disabled
    }
}
