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
        self.setupTapGesture()
    }

    // MARK: - func

    private func configureUI() {
        self.view.backgroundColor = .black.withAlphaComponent(0.4)
    }

    private func setupLayout() {
        self.view.addSubview(self.popupView)
        self.popupView.constraint(centerX: self.view.centerXAnchor,
                                  centerY: self.view.centerYAnchor,
                                  padding: UIEdgeInsets.zero)
    }

    private func setupTapGesture() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.didTappedView(_:)))
        self.view.addGestureRecognizer(tapGestureRecognizer)
    }

    func setupPopupData(title: String, summary: String) {
        self.popupView.setupLabel(newsTitle: title, mySummary: summary)
    }

    // MARK: - selector

    @objc
    private func didTappedView(_ gestureRecognizer: UITapGestureRecognizer) {
        self.dismiss(animated: true)
    }
}
