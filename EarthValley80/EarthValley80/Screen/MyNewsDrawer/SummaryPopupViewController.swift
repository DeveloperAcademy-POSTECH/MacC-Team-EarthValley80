//
//  SummaryPopupViewController.swift
//  EarthValley80
//
//  Created by LeeJiSoo on 2022/11/07.
//

import UIKit

final class SummaryPopupViewController: UIViewController {

    // MARK: - property

    private let popupView = SummaryPopupView()

    // MARK: - life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupLayout()
        self.configureUI()
    }

    // MARK: - func

    private func configureUI() {
        self.view.backgroundColor = .black.withAlphaComponent(0.4)
        // TODO: - 더미데이터 입니다. 
        self.popupView.setupLabel(newsTitle: "adjf;adfasdfad", mySummary: "asdfadfasdfasdfasdfadsfadf")
    }

    private func setupLayout() {
        self.view.addSubview(self.popupView)
        self.popupView.constraint(centerX: self.view.centerXAnchor,
                                  centerY: self.view.centerYAnchor,
                                  padding: UIEdgeInsets.zero)
    }
}
