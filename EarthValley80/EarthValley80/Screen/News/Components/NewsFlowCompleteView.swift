//
//  NewsFlowCompleteView.swift
//  EarthValley80
//
//  Created by SHIN YOON AH on 2022/11/09.
//

import UIKit

import Lottie

final class NewsFlowCompleteView: UIView {
    
    // MARK: - property
    
    private let congratImageView: UIImageView = UIImageView(image: ImageLiteral.imgCongrat)
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = StringLiteral.completeTitleDescription
        label.textColor = .evyBlack2
        label.font = .font(.bold, ofSize: 20)
        label.numberOfLines = 2
        label.applyColor(to: "완성했어요!", with: .evyBlack1)
        label.applyFont(to: "완성했어요!", with: .font(.bold, ofSize: 40))
        label.setLineSpacing(kernValue: -1.0, lineSpacing: 10.0)
        label.textAlignment = .center
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
    
    deinit {
        self.congratImageView.removeFromSuperview()
    }
    
    // MARK: - func
    
    private func setupLayout() {
        self.addSubview(self.congratImageView)
        self.congratImageView.constraint(top: self.topAnchor,
                                         centerX: self.centerXAnchor,
                                         padding: UIEdgeInsets(top: 220, left: 0, bottom: 0, right: 0))
        self.congratImageView.constraint(.widthAnchor, constant: 150)
        self.congratImageView.constraint(.heightAnchor, constant: 137)
        
        self.addSubview(self.titleLabel)
        self.titleLabel.constraint(top: self.congratImageView.bottomAnchor,
                                   centerX: self.centerXAnchor,
                                   padding: UIEdgeInsets(top: 31, left: 0, bottom: 0, right: 0))
    }
    
    private func configureUI() {
        self.backgroundColor = .white.withAlphaComponent(0.9)
    }
}