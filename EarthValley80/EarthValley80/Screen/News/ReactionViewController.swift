//
//  ReactionViewController.swift
//  EarthValley80
//
//  Created by SHIN YOON AH on 2022/11/17.
//

import UIKit

final class ReactionViewController: UIViewController {

    // MARK: - property

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .font(.bold, ofSize: 34)
        // TODO: - 더미로 넣어둔 텍스트
        label.text = "세상에 다람쥐가 없다고 무슨 문제야?"
        label.textColor = .evyWhite
        return label
    }()
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .font(.regular, ofSize: 16)
        label.text = StringLiteral.reactionDescription
        label.textColor = .evyWhite
        return label
    }()

    // MARK: - life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupLayout()
        self.configureUI()
    }

    // MARK: - func

    private func setupLayout() {
        self.view.addSubview(self.titleLabel)
        self.titleLabel.constraint(top: self.view.topAnchor,
                                   centerX: self.view.centerXAnchor,
                                   padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))

        self.view.addSubview(self.descriptionLabel)
        self.descriptionLabel.constraint(top: self.titleLabel.topAnchor,
                                         centerX: self.view.centerXAnchor,
                                         padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
    }

    private func configureUI() {
        self.view.backgroundColor = .black.withAlphaComponent(0.94)
    }
}
