//
//  YomojomoNewsViewController.swift
//  EarthValley80
//
//  Created by SHIN YOON AH on 2022/10/17.
//

import UIKit

class YomojomoNewsViewController: UIViewController {

    // MARK: - property

    private let yomojomoTitleView: MainTitleView = {
        let titleView = MainTitleView()
        titleView.dateLabel.text = Date().dateFormatted("EEEE, MMM d")
        titleView.yomojomoTitleLabel.text = StringLiteral.yomojomoNewsTitle
        titleView.titleDescriptionLabel.text = StringLiteral.yomojomoNewsTitleDescription
        return titleView
    }()

    // MARK: - life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupLayout()
    }

    // MARK: - func

    private func setupLayout() {
        self.view.addSubview(yomojomoTitleView)
        yomojomoTitleView.constraint(top: self.view.safeAreaLayoutGuide.topAnchor,
                                     leading: self.view.leadingAnchor,
                                     trailing: self.view.leadingAnchor,
                                     padding: UIEdgeInsets(top: 60, left: 0, bottom: 0, right: 0))
    }
}
