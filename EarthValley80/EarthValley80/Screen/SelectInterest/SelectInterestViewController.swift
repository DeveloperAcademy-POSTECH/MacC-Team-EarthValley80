//
//  SelectInterestViewController.swift
//  EarthValley80
//
//  Created by LeeJiSoo on 2022/11/23.
//

import UIKit

final class SelectInterestViewController: UIViewController {

    // MARK: - property
    private let greetingLabel: UILabel = {
        let label = UILabel()
        label.text = StringLiteral.greetingTitle
        label.font = .font(.regular, ofSize: 12)
        return label
    }()
    private let selectGuideTitleLabel: UILabel = {
        let label = UILabel()
        label.text = StringLiteral.selectGuideTitle
        label.font = .font(.title, ofSize: 40)
        label.numberOfLines = 0
        return label
    }()
    private let finishButton = GotoSomewhereButton()

    // MARK: - life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupLayout()
        self.setupButton()
    }

    // MARK: - func

    private func setupButton() {
        self.finishButton.setupButtonContents(buttonImage: ImageLiteral.icoCheck,
                                              buttonTitle: StringLiteral.finishSelectButtonText)
    }

    private func setupLayout() {
        self.view.addSubview(self.greetingLabel)
        self.greetingLabel.constraint(top: self.view.topAnchor,
                                      leading: self.view.leadingAnchor,
                                      padding: UIEdgeInsets(top: 60.adjustedHeight, left: 40.adjustedWidth, bottom: 0, right: 0))

        self.view.addSubview(self.selectGuideTitleLabel)
        self.selectGuideTitleLabel.constraint(top: self.greetingLabel.bottomAnchor,
                                              leading: self.greetingLabel.leadingAnchor,
                                              padding: UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0))

        self.view.addSubview(self.finishButton)
        self.finishButton.constraint(bottom: self.view.bottomAnchor,
                                     trailing: self.view.trailingAnchor,
                                     padding: UIEdgeInsets(top: 0,
                                                           left: 0,
                                                           bottom: 46.adjustedHeight,
                                                           right: 40.adjustedWidth))
     }
 }
