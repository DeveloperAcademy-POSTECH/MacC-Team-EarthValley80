//
//  NewsContentTableViewCell.swift
//  EarthValley80
//
//  Created by SHIN YOON AH on 2022/10/25.
//

import UIKit

private extension UIColor {
    static var expandedTextColor: UIColor {
        return .white.withAlphaComponent(0.14)
    }
    
    static var highlightTextColor: UIColor {
        return .white
    }
}

final class NewsContentTableViewCell: UITableViewCell {
    
    private enum Size {
        static let horizontalPadding: CGFloat = 50.0
        static let originalFontSize: CGFloat = 34.0
        static let originalLineHeightMultiple: CGFloat = 1.16
    }
    
    enum Direction {
        case upper, lower
    }
    
    // MARK: - property
    
    private lazy var contentLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .expandedTextColor
        label.font = .font(.regular, ofSize: Size.originalFontSize)
        label.text = self.newsManager.newsContent
        label.setLineSpacing(kernValue: -2.0,
                             lineHeightMultiple: Size.originalLineHeightMultiple)

        return label
    }()

    private let newsManager = NewsManager.shared
    private var sentences: [String] = []
    private var readingIndex: Int = -1

    // MARK: - init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupLayout()
        self.configureUI()
        self.appendSentences()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - func
    
    private func setupLayout() {
        self.contentView.addSubview(self.contentLabel)
        self.contentLabel.constraint(top: self.contentView.topAnchor,
                                     leading: self.contentView.leadingAnchor,
                                     bottom: self.contentView.bottomAnchor,
                                     trailing: self.contentView.trailingAnchor,
                                     padding: UIEdgeInsets(top: 0, left: Size.horizontalPadding, bottom: 0, right: Size.horizontalPadding))
    }
    
    private func configureUI() {
        self.backgroundColor = .clear
        self.selectionStyle = .none
    }
    
    private func appendSentences() {
        guard let content = self.contentLabel.text else { return }
        
        self.sentences = content.components(separatedBy: [".", "!", "?"]).map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }.filter { !$0.isEmpty }
    }
    
    private func applyHighlight(to index: Int) {
        guard index < self.sentences.count && index >= 0 else { return }
        let separatorCharacters: [String] = [".", "?", "!"]
        let sentencesWithCharacter = separatorCharacters.map({ "\(self.sentences[index])\($0)" })
        
        for sentence in sentencesWithCharacter {
            if let hasSentence = self.contentLabel.text?.contains(sentence),
               hasSentence {
                self.contentLabel.applyColor(to: sentence, with: .evyWhite)
                break
            }
        }
        
        self.contentLabel.setLineSpacing(kernValue: -2.0,
                                         lineHeightMultiple: Size.originalLineHeightMultiple)
    }
    
    func shiftHighlight(to direction: Direction) {
        switch direction {
        case .upper:
            guard (self.readingIndex - 1) >= 0 else { return }
            self.readingIndex -= 1
        case .lower:
            guard (self.readingIndex + 1) < self.sentences.count else { return }
            self.readingIndex += 1
        }
        
        self.applyHighlight(to: self.readingIndex)
    }
    
    func checkCurrentPosition() -> UITableView.ScrollPosition {
        guard !self.sentences.isEmpty else { return .none }
        let calculatedValue = CGFloat(self.readingIndex) / CGFloat(self.sentences.count)
        
        switch calculatedValue {
        case 0..<0.4:
            return .top
        case 0.4..<0.7:
            return .middle
        default:
            return .bottom
        }
    }
}
