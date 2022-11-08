//
//  AnswerCollectionViewCell.swift
//  EarthValley80
//
//  Created by SHIN YOON AH on 2022/11/07.
//

import UIKit

final class AnswerCollectionViewCell: UICollectionViewCell {
    
    private enum Size {
        static let innerViewHeight: CGFloat = 30.0
    }
    
    // MARK: - property
    
    private let captionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .evyGray1
        label.font = .font(.bold, ofSize: 10)
        return label
    }()
    private let capsuleView: UIView = {
        let view = UIView()
        view.backgroundColor = .evyGray2
        return view
    }()
    private let contentLabel: UILabel = {
        let label = UILabel()
        label.textColor = .evyBlack2
        label.font = .font(.bold, ofSize: 16)
        return label
    }()
    
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
        self.contentView.addSubview(self.captionLabel)
        self.captionLabel.constraint(top: self.contentView.topAnchor,
                                     leading: self.contentView.leadingAnchor)
        
        self.contentView.addSubview(self.capsuleView)
        self.capsuleView.constraint(top: self.captionLabel.bottomAnchor,
                                    leading: self.contentView.leadingAnchor,
                                    bottom: self.contentView.bottomAnchor,
                                    trailing: self.contentView.trailingAnchor)
        self.capsuleView.constraint(.heightAnchor, constant: Size.innerViewHeight)
        
        self.capsuleView.addSubview(self.contentLabel)
        self.contentLabel.constraint(to: self.capsuleView,
                                     insets: UIEdgeInsets(top: 6, left: 12, bottom: -4, right: -12))
    }
    
    private func configureUI() {
        let cellCornerRadius = (self.bounds.size.width * (Size.innerViewHeight / self.bounds.size.width)) / 2
        self.capsuleView.layer.cornerRadius = cellCornerRadius
    }
    
    func setupAnswerCell(of caption: String, answer: String) {
        self.captionLabel.text = caption
        self.contentLabel.text = answer
    }
}
