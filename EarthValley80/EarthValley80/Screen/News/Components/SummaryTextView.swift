//
//  SummaryTextView.swift
//  EarthValley80
//
//  Created by SHIN YOON AH on 2022/11/18.
//

import UIKit

final class SummaryTextView: UIView {

    private enum Size {
        static let backgroundSpacing: CGFloat = 30.0
        static let textViewSpacing: CGFloat = 20.0
        static let containerTopInset: CGFloat = 64 - textViewSpacing
    }

    enum TextMode {
        case beforeWriting
        case writing
        case complete

        var placeholder: String? {
            switch self {
            case .beforeWriting:
                return StringLiteral.summarizePlaceholder
            default:
                return nil
            }
        }

        var textColor: UIColor {
            switch self {
            case .beforeWriting:
                return .tertiaryLabel
            default:
                return .evyBlack2
            }
        }
    }

    var textViewDidEditing: ((Bool) -> ())?

    // MARK: - property

    private let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .evyWhite
        view.layer.cornerRadius = 30.0
        return view
    }()
    private lazy var contentTextView: UITextView = {
        let textView = UITextView()
        textView.textContainer.lineBreakMode = .byCharWrapping
        textView.setTypingAttributes(lineSpacing: 10.0)
        textView.font = .font(.regular, ofSize: 34)
        textView.tintColor = .evyBlack2
        textView.backgroundColor = .clear
        textView.textContainerInset = UIEdgeInsets(top: Size.containerTopInset, left: 40, bottom: 0, right: 72)
        textView.delegate = self
        return textView
    }()

    var textMode: TextMode? {
        willSet {
            guard let newValue = newValue,
                  newValue != .complete else { return }

            self.updateTextViewConfiguration(with: newValue)
        }
    }

    private var textViewConstraint: [ConstraintType: NSLayoutConstraint]?

    // MARK: - init

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupLayout()
        self.setupNotificationCenter()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    // MARK: - func

    private func setupLayout() {
        self.addSubview(backgroundView)
        self.backgroundView.constraint(top: self.topAnchor,
                                       leading: self.leadingAnchor,
                                       bottom: self.bottomAnchor,
                                       trailing: self.trailingAnchor,
                                       padding: UIEdgeInsets(top: 0, left: Size.backgroundSpacing, bottom: Size.backgroundSpacing, right: Size.backgroundSpacing))

        self.backgroundView.addSubview(self.contentTextView)
        self.textViewConstraint = self.contentTextView.constraint(top: self.backgroundView.topAnchor,
                                                                  leading: self.backgroundView.leadingAnchor,
                                                                  bottom: self.backgroundView.bottomAnchor,
                                                                  trailing: self.backgroundView.trailingAnchor,
                                                                  padding: UIEdgeInsets(top: Size.textViewSpacing, left: 0, bottom: -Size.textViewSpacing, right: 0))

    }

    private func setupNotificationCenter() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    private func updateTextViewConfiguration(with state: TextMode) {
        self.contentTextView.text = state.placeholder
        self.contentTextView.textColor = state.textColor
    }

    // MARK: - selector

    @objc
    private func keyboardWillShow(_ notification: NSNotification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height

            self.textViewConstraint?[.bottom]?.constant = -keyboardHeight
        }
    }

    @objc
    private func keyboardWillHide(_ notification: NSNotification) {
        self.textViewConstraint?[.bottom]?.constant = -Size.backgroundSpacing
    }
}

// MARK: - UITextViewDelegate
extension SummaryTextView: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        let isBeforeWriting = self.textMode == .beforeWriting
        if isBeforeWriting {
            self.textMode = .writing
        }
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        let isEmpty = textView.text.isEmpty
        self.textMode = isEmpty ? .beforeWriting : .complete
    }

    func textViewDidChange(_ textView: UITextView) {
        self.textViewDidEditing?(textView.hasText)
    }
}
