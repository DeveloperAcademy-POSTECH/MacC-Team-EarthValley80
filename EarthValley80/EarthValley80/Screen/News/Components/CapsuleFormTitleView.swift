//
//  CapsuleFormTitleView.swift
//  EarthValley80
//
//  Created by SHIN YOON AH on 2022/11/17.
//

import UIKit

final class CapsuleFormTitleView: UIView {

    // MARK: - property

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .font(.bold, ofSize: 18)
        label.textColor = .evyWhite
        return label
    }()

    // MARK: - init

    init(title: String) {
        super.init(frame: .zero)
        self.titleLabel.text = title

        self.setupLayout()
        self.configureUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - func

    private func setupLayout() {
        self.addSubview(self.titleLabel)
        self.titleLabel.constraint(to: self,
                                   insets: UIEdgeInsets(top: 7, left: 31, bottom: -7, right: -30))
        self.constraint(.heightAnchor, constant: 32)
    }

    private func configureUI() {
        self.backgroundColor = .evyWhite.withAlphaComponent(0.28)
        self.layer.borderColor = UIColor.evyWhite.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 12.0
    }
}
