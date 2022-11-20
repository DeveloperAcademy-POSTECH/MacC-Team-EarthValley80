//
//  SummaryCompletionViewController.swift
//  EarthValley80
//
//  Created by SHIN YOON AH on 2022/11/20.
//

import UIKit

final class SummaryCompletionViewController: UIViewController {

    // MARK: - property



    // MARK: - life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupLayout()
        self.configureUI()
    }

    // MARK: - func

    private func setupLayout() {

    }

    private func configureUI() {
        // TODO: - 컬러셋 정해지면 변경
        self.view.backgroundColor = .black.withAlphaComponent(0.94)
    }
}
