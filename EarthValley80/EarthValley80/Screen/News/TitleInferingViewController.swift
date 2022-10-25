//
//  TitleInferingViewController.swift
//  EarthValley80
//
//  Created by SHIN YOON AH on 2022/10/25.
//

import UIKit

final class TitleInferingViewController: UIViewController {
    
    // MARK: - property
    
    private let blurContentLabel: BlurredLabel = {
        let label = BlurredLabel()
        label.isBlurring = true
        
        return label
    }()
    private let titleView = NewsTitleHeaderView()
    private let backButton = BackButton()
    
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
        
        self.view.addSubview(self.titleView)
        self.titleView.constraint(top: self.view.topAnchor,
                                  leading: self.view.leadingAnchor,
                                  trailing: self.view.trailingAnchor,
                                  padding: UIEdgeInsets(top: 30, left: 0, bottom: 0, right: 0))
        
        self.view.addSubview(self.blurContentLabel)
        self.blurContentLabel.constraint(top: self.titleView.bottomAnchor,
                                         leading: self.view.leadingAnchor,
                                         bottom: self.view.bottomAnchor,
                                         trailing: self.view.trailingAnchor)
    }
    
    private func configureUI() {
        // TODO: - background gradient Color가 나오면 적용
        self.view.backgroundColor = .black
    }
}
