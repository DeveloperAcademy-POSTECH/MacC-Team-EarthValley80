//
//  BackButton.swift
//  EarthValley80
//
//  Created by SHIN YOON AH on 2022/10/25.
//

import UIKit

final class BackButton: UIButton {

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
        self.constraint(.heightAnchor, constant: 44)
        self.constraint(.widthAnchor, constant: 107)
    }
    
    private func configureUI() {
        if #available(iOS 15.0, *) {
            var configuration = UIButton.Configuration.plain()
            configuration.attributedTitle = AttributedString(stringLiteral: StringLiteral.backButtonText)
            configuration.image = ImageLiteral.icChevronLeft
            configuration.baseForegroundColor = .white
            configuration.imagePadding = 10
            self.configuration = configuration
        } else {
            self.tintColor = .evyWhite
            self.setImage(ImageLiteral.icChevronLeft, for: .normal)
            self.setTitle(StringLiteral.backButtonText, for: .normal)
            self.imageEdgeInsets = UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 0)
        }
    }
}
