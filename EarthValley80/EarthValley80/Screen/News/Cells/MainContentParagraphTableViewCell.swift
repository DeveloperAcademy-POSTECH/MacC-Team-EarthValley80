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
    private let contentLabel: UILabel = {
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
    }

    private func appendSentences() {
        guard let content = self.contentLabel.text else { return }

        let _ = content.components(separatedBy: [".", "!", "?"])
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            .filter { !$0.isEmpty }
            .compactMap { self.applyPunctuationMark(in: $0) }
            .map { sentence in
                let closedRange = self.findRangeOfSentence(sentence)
                self.sentences[closedRange] = sentence
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
        print(selectedIndex)


//        let subTextRect = self.contentLabel.boundingRectForCharacterRange(subText: "글자를 새긴 차")
//        let rect = UIView(frame: subTextRect!)
//        rect.backgroundColor = .red
//        self.contentView.addSubview(rect)
    }
}

extension UILabel {
    /// 입력된 포지션에 따라 라벨의 문자열의 인덱스 반환
    /// - Parameter point: 인덱스 값을 알고 싶은 CGPoint
    func textIndex(at point: CGPoint) -> Int? {
        guard let attributedText = attributedText else { return nil }

        let layoutManager = NSLayoutManager()
        let textContainer = NSTextContainer(size: self.bounds.size)
        let textStorage = NSTextStorage(attributedString: attributedText)

        textStorage.addLayoutManager(layoutManager)
        textContainer.lineFragmentPadding = 0.0
        layoutManager.addTextContainer(textContainer)

        var textOffset = CGPoint.zero
        // 정확한 자체(glyph)의 범위를 구하고 그 범위의 CGRect 값을 구합니다.
        let range = layoutManager.glyphRange(for: textContainer)
        let textBounds = layoutManager.boundingRect(
            forGlyphRange: range,
            in: textContainer
        )

        // textOffset.x가 패딩을 제외한 부분부터 시작하도록 합니다.
        let paddingWidth = (self.bounds.size.width - textBounds.size.width) / 2
        if paddingWidth > 0 {
            textOffset.x = paddingWidth
        }

        // 눌려진 정확한 포인트를 구합니다.
        let newPoint = CGPoint(
            x: point.x - textOffset.x,
            y: point.y - textOffset.y
        )

        // textContainer내에서 newPoint 위치의 glyph index를 반환합니다
        return layoutManager.glyphIndex(for: newPoint, in: textContainer)
    }

    func boundingRectForCharacterRange(subText: String) -> CGRect? {
        guard let attributedText = attributedText else { return nil }
        guard let text = self.text else { return nil }

        // 전체 텍스트(text)에서 subText만큼의 range를 구합니다.
        guard let subRange = text.range(of: subText) else { return nil }
        let range = NSRange(subRange, in: text)

        // attributedText를 기반으로 한 NSTextStorage를 선언하고 NSLayoutManager를 추가합니다.
        let layoutManager = NSLayoutManager()
        let textStorage = NSTextStorage(attributedString: attributedText)
        textStorage.addLayoutManager(layoutManager)

        // instrinsicContentSize를 기반으로 NSTextContainer를 선언하고
        let textContainer = NSTextContainer(size: intrinsicContentSize)
        // 정확한 CGRect를 구해야하므로 padding 값은 0을 줍니다.
        textContainer.lineFragmentPadding = 0.0
        // layoutManager에 추가합니다.
        layoutManager.addTextContainer(textContainer)

        var glyphRange = NSRange()
        // 주어진 범위(rage)에 대한 실질적인 glyphRange를 구합니다.
        layoutManager.characterRange(
            forGlyphRange: range,
            actualGlyphRange: &glyphRange
        )

        // textContainer 내의 지정된 glyphRange에 대한 CGRect 값을 반환합니다.
        return layoutManager.boundingRect(
            forGlyphRange: glyphRange,
            in: textContainer
        )
    }
}
