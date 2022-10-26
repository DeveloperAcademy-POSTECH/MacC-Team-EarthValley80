//
//  QuestionView.swift
//  EarthValley80
//
//  Created by SHIN YOON AH on 2022/10/25.
//

import UIKit

final class QuestionView: UIView {
    
    private enum Size {
        static let height: CGFloat = UIScreen.main.bounds.size.height - 32.0
        static let width: CGFloat = UIScreen.main.bounds.size.width * 0.48
    }
    
    // MARK: - property
    
    private let captionLabel: UILabel = {
        let label = UILabel()
        label.font = .font(.bold, ofSize: 12)
        label.lineBreakStrategy = .hangulWordPriority
        // TODO: - 색상이 확정되면 추가
        label.textColor = .lightGray
        return label
    }()
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .font(.bold, ofSize: 20)
        label.textColor = .black
        return label
    }()
    
    var captionText: String = "" {
        willSet {
            captionLabel.text = newValue
            captionLabel.setLineSpacing(kernValue: -0.2)
        }
    }
    
    var titleText: String = "" {
        willSet {
            titleLabel.text = newValue
            titleLabel.setLineSpacing(kernValue: -0.3)
        }
    }

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
        
        self.addSubview(captionLabel)
        self.captionLabel.constraint(top: self.topAnchor,
                                     leading: self.leadingAnchor,
                                     padding: UIEdgeInsets(top: 52, left: 40, bottom: 0, right: 0))
        
        self.addSubview(titleLabel)
        self.titleLabel.constraint(top: self.captionLabel.bottomAnchor,
                                   leading: self.leadingAnchor,
                                   padding: UIEdgeInsets(top: 10, left: 40, bottom: 0, right: 0))
    }
    
    private func configureUI() {
        self.backgroundColor = .white
        self.layer.cornerRadius = 30
    }
}
