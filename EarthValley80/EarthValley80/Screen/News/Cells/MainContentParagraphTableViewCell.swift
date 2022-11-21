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

    func setupContentParagraphData(paragraphIndex: Int, content: String) {
        self.captionLabel.text = paragraphIndex.description
        self.contentLabel.text = content
        self.contentLabel.setLineSpacing(kernValue: -2.0,
                                         lineHeightMultiple: Size.minimumLineHeightMultiple)
    }

    // MARK: - selector

    @objc
    private func didTappedView(_ gestureRecognizer: UITapGestureRecognizer) {
        print("탭탭")
    }
}
