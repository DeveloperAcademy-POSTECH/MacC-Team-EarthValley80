//
//  MainContentParagraphTableViewCell.swift
//  EarthValley80
//
//  Created by SHIN YOON AH on 2022/11/21.
//

import UIKit

private extension UIColor {
    static var originalTextColor: UIColor {
        return .white.withAlphaComponent(0.14)
    }

    static var highlightTextColor: UIColor {
        return .white
    }
}

final class MainContentParagraphTableViewCell: UITableViewCell {

    private enum Size {
        static let horizontalPadding: CGFloat = 50.0
        static let contentFontSize: CGFloat = 20.0
        static let captionFontSize: CGFloat = 8.0
        static let minimumLineHeightMultiple: CGFloat = 1.5
    }

    @frozen
    private enum TextStyle {
        case caption(ParagraphType)
        case content(ParagraphType)

        var font: UIFont {
            switch self {
            case .caption(let type):
                return .font(type.fontName, ofSize: Size.captionFontSize)
            case .content(let type):
                return .font(type.fontName, ofSize: Size.contentFontSize)
            }
        }
    }

    @frozen
    enum ParagraphType {
        case highlighted
        case original

        var textColor: UIColor {
            switch self {
            case .highlighted:
                return .highlightTextColor
            case .original:
                return .originalTextColor
            }
        }

        var fontName: FontName {
            switch self {
            case .highlighted:
                return .bold
            case .original:
                return .regular
            }
        }

        var isUserInteractionEnabled: Bool {
            switch self {
            case .highlighted:
                return true
            case .original:
                return false
            }
        }
    }

    var didTappedMainSentence: ((String) -> ())?
    var sentencecece: String = ""

    // MARK: - property

    override var isSelected: Bool {
        willSet {
            self.setSelected(newValue, animated: false)
        }
    }

    private let captionLabel: UILabel = {
        let label = UILabel()
        label.textColor = ParagraphType.original.textColor
        label.font = TextStyle.caption(.original).font
        return label
    }()
    let contentLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = ParagraphType.original.textColor
        label.font = TextStyle.content(.original).font
        return label
    }()

    private lazy var tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.didTappedView(_:)))

    private var sentences: [ClosedRange<Int>: String] = [:]

    // MARK: - init

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupLayout()
        self.configureUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - func

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        let paragraphType: ParagraphType = selected ? .highlighted : .original
        self.setupParagraphStyle(to: paragraphType)
    }

    private func setupLayout() {
        self.contentView.addSubview(self.contentLabel)
        self.contentLabel.constraint(top: self.contentView.topAnchor,
                                     leading: self.contentView.leadingAnchor,
                                     bottom: self.contentView.bottomAnchor,
                                     trailing: self.contentView.trailingAnchor,
                                     padding: UIEdgeInsets(top: 0, left: Size.horizontalPadding, bottom: 42, right: Size.horizontalPadding))

        self.contentView.addSubview(self.captionLabel)
        self.captionLabel.constraint(top: self.contentView.topAnchor,
                                     leading: self.contentView.leadingAnchor,
                                     padding: UIEdgeInsets(top: 14, left: Size.horizontalPadding + 17, bottom: 0, right: 0))
    }

    private func configureUI() {
        self.backgroundColor = .clear
        self.selectionStyle = .none

        self.contentLabel.addGestureRecognizer(tapGestureRecognizer)
    }

    private func setupParagraphStyle(to paragraphType: ParagraphType) {
        self.captionLabel.font = TextStyle.caption(paragraphType).font
        self.contentLabel.font = TextStyle.content(paragraphType).font
        self.captionLabel.textColor = paragraphType.textColor
        self.contentLabel.textColor = paragraphType.textColor
        self.contentLabel.isUserInteractionEnabled = paragraphType.isUserInteractionEnabled
        if paragraphType == .original {
            self.contentLabel.applyBorder(to: "", color: .white.withAlphaComponent(0.01))
        }
    }

    private func appendSentences() {
        guard let content = self.contentLabel.text else { return }

        let _ = content.components(separatedBy: [".", "!", "?"])
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            .filter { !$0.isEmpty }
            .compactMap { sentence in
                guard let completionSentence = self.applyPunctuationMark(in: sentence) else { return }
                let closedRange = self.findRangeOfSentence(completionSentence)
                self.sentences[closedRange] = completionSentence
            }
    }

    private func applyPunctuationMark(in sentence: String) -> String? {
        let separatorCharacters: [String] = [".", "?", "!"]
        let sentencesWithCharacter = separatorCharacters.map({ "\(sentence)\($0)" })

        for sentence in sentencesWithCharacter {
            if let hasSentence = self.contentLabel.text?.contains(sentence),
               hasSentence {
                return sentence
            }
        }

        return nil
    }

    private func findRangeOfSentence(_ sentence: String) -> ClosedRange<Int> {
        guard let content = self.contentLabel.text else { return 0...0 }
        let range = content.range(of: sentence)

        guard
            let lowerBound = range?.lowerBound.utf16Offset(in: content),
            let upperBound = range?.upperBound.utf16Offset(in: content)
        else { return 0...0 }

        return lowerBound...upperBound
    }

    func setupContentParagraphData(paragraphIndex: Int, content: String) {
        self.captionLabel.text = paragraphIndex.description
        self.contentLabel.text = content
        self.contentLabel.setLineSpacing(kernValue: -2.0,
                                         lineHeightMultiple: Size.minimumLineHeightMultiple)
        self.appendSentences()
    }

    // MARK: - selector

    @objc
    private func didTappedView(_ gestureRecognizer: UITapGestureRecognizer) {
        guard gestureRecognizer.state == UIGestureRecognizer.State.recognized else { return }
        let gesturePoint = gestureRecognizer.location(in: gestureRecognizer.view)
        guard let selectedIndex = self.contentLabel.textIndex(at: gesturePoint) else { return }

        for sentence in self.sentences {
            let closedRange = sentence.key

            if closedRange.contains(selectedIndex) {
                self.contentLabel.applyBorder(to: sentence.value, color: .white)
                sentencecece = sentence.value

                self.didTappedMainSentence?(sentence.value)
                break
            }
        }
    }
}
