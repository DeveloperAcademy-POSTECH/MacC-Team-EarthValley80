//
//  SummaryCompletionViewController.swift
//  EarthValley80
//
//  Created by SHIN YOON AH on 2022/11/20.
//

import UIKit

final class SummaryCompletionViewController: UIViewController {

    // MARK: - property

    private let titleView: CapsuleFormTitleView = CapsuleFormTitleView(title: StringLiteral.summaryCompletionTitle)
    private let celebrateImageView: UIImageView = {
        let imageView = UIImageView()
        // TODO: - 후에 이미지 에셋으로 변경할 예정입니다.
        imageView.backgroundColor = .cyan
        return imageView
    }()

    // MARK: - life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupLayout()
        self.configureUI()
    }

    // MARK: - func

    private func setupLayout() {
        self.view.addSubview(self.titleView)
        self.titleView.constraint(top: self.view.topAnchor,
                                  centerX: self.view.centerXAnchor,
                                  padding: UIEdgeInsets(top: 210.adjustedHeight, left: 0, bottom: 0, right: 0))

        self.view.addSubview(self.celebrateImageView)
        self.celebrateImageView.constraint(top: self.titleView.topAnchor,
                                           centerX: self.view.centerXAnchor,
                                           padding: UIEdgeInsets(top: 8, left: 0, bottom: 0, right: 0))
        self.celebrateImageView.constraint(.widthAnchor, constant: 416.adjustedWidth)
        self.celebrateImageView.constraint(.heightAnchor, constant: 290.adjustedHeight)
    }

    private func configureUI() {
        // TODO: - 컬러셋 정해지면 변경
        self.view.backgroundColor = .black.withAlphaComponent(0.94)
    }
}
