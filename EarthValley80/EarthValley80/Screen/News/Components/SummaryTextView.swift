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
        case write
        case complete

        var placeholder: String? {
            switch self {
            case .beforeWriting:
                return "리뷰를 남겨주세요"
            default:
                return nil
            }
        }

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
        textView.tintColor = .evyBlack1
        textView.backgroundColor = .clear
        textView.textContainerInset = UIEdgeInsets(top: Size.containerTopInset, left: 40, bottom: 0, right: 72)
        textView.delegate = self
        return textView
    }()

    // MARK: - init

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupLayout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        self.contentTextView.constraint(to: self.backgroundView,
                                        insets: UIEdgeInsets(top: Size.textViewSpacing, left: 0, bottom: -Size.textViewSpacing, right: 0))

    }
}

extension SummaryTextView: UITextViewDelegate {
    
}
