//
//  AnswerCollectionViewCell.swift
//  EarthValley80
//
//  Created by SHIN YOON AH on 2022/11/07.
//

import UIKit

final class AnswerCollectionViewCell: UICollectionViewCell {
    
    private enum Size {
        static let answerInnerViewHeight: CGFloat = 30.0
        static let keywordInnerViewHeight: CGFloat = 56.0
    }
    
    enum CellType {
        case answer
        case keyword
        
        var contentFont: UIFont {
            switch self {
            case .answer:
                return .font(.bold, ofSize: 16)
            case .keyword:
                return .font(.bold, ofSize: 30)
            }
        }
        
        var captionFont: UIFont {
            switch self {
            case .answer:
                return .font(.bold, ofSize: 10)
            case .keyword:
                return .font(.bold, ofSize: 12)
            }
        }
        
        var contentInset: UIEdgeInsets {
            switch self {
            case .answer:
                return UIEdgeInsets(top: 6, left: 12, bottom: -4, right: -12)
            case .keyword:
                return UIEdgeInsets(top: 16, left: 20, bottom: -10, right: -20)
            }
        }
        
        var cellInnerViewHeight: CGFloat {
            switch self {
            case .answer:
                return Size.answerInnerViewHeight
            case .keyword:
                return Size.keywordInnerViewHeight
            }
        }
    }
    
    // MARK: - property
    
    private lazy var captionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .evyGray1
        label.font = self.cellType?.captionFont
        return label
    }()
    private let capsuleView: UIView = {
        let view = UIView()
        view.backgroundColor = .evyGray2
        return view
    }()
    private lazy var contentLabel: UILabel = {
        let label = UILabel()
        label.textColor = .evyBlack2
        label.font = self.cellType?.contentFont
        return label
    }()
    var cellType: CellType? {
        didSet {
            self.setupLayout()
            self.configureUI()
        }
    }
    
    // MARK: - func
    
    private func setupLayout() {
        self.contentView.addSubview(self.captionLabel)
        self.captionLabel.constraint(top: self.contentView.topAnchor,
                                     leading: self.contentView.leadingAnchor)
        
        self.contentView.addSubview(self.capsuleView)
        self.capsuleView.constraint(top: self.captionLabel.bottomAnchor,
                                    leading: self.contentView.leadingAnchor,
                                    bottom: self.contentView.bottomAnchor,
                                    trailing: self.contentView.trailingAnchor)
        self.capsuleView.constraint(.heightAnchor, constant: self.cellType?.cellInnerViewHeight ?? 0)
        
        self.capsuleView.addSubview(self.contentLabel)
        self.contentLabel.constraint(to: self.capsuleView,
                                     insets: self.cellType?.contentInset ?? .zero)
    }
    
    private func configureUI() {
        if let height = self.cellType?.cellInnerViewHeight {
            let cellCornerRadius = (self.bounds.size.width * (height / self.bounds.size.width)) / 2
            self.capsuleView.layer.cornerRadius = cellCornerRadius
        }
    }
    
    func setupAnswerCell(of caption: String, answer: String) {
        self.captionLabel.text = caption
        self.contentLabel.text = answer
    }
}
