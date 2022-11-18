//
//  SummaryViewController.swift
//  EarthValley80
//
//  Created by SHIN YOON AH on 2022/11/18.
//

import UIKit

final class SummaryViewController: UIViewController {

    // MARK: - property

    private let captionLabel: UILabel = {
        let label = UILabel()
        label.font = .font(.bold, ofSize: 15)
        label.text = StringLiteral.readingNewsCaptionTitle
        label.textColor = .evyWhite
        return label
    }()
    private let backButton = BackButton()
    private let titleView: CapsuleFormTitleView = CapsuleFormTitleView(title: StringLiteral.summaryTitle)


    // MARK: - life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupLayout()
        self.configureUI()
    }

    // MARK: - func

    private func setupLayout() {
        self.view.addSubview(self.backButton)
        self.backButton.constraint(top: self.view.topAnchor,
                                   leading: self.view.leadingAnchor,
                                   padding: UIEdgeInsets(top: 26, left: 10, bottom: 0, right: 0))

        self.view.addSubview(self.captionLabel)
        self.captionLabel.constraint(top: self.view.topAnchor,
                                     centerX: self.view.centerXAnchor,
                                     padding: UIEdgeInsets(top: 40, left: 0, bottom: 0, right: 0))

        self.view.addSubview(self.titleView)
        self.titleView.constraint(top: self.captionLabel.bottomAnchor,
                                  centerX: self.view.centerXAnchor,
                                  padding: UIEdgeInsets(top: 44, left: 0, bottom: 0, right: 0))
    }

    private func configureUI() {
        // TODO: - 컬러셋 정해지면 변경
        self.view.backgroundColor = .black.withAlphaComponent(0.94)
    }
}
