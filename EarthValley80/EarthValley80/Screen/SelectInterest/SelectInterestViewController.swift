//
//  SelectInterestViewController.swift
//  EarthValley80
//
//  Created by LeeJiSoo on 2022/11/23.
//

import UIKit

class SelectInterestViewController: UIViewController {

    // MARK: - property
    
    private lazy var scrollView: UIScrollView = {
        let scrollview = UIScrollView()
        scrollview.backgroundColor = .evyWhite
        scrollview.showsVerticalScrollIndicator = true
        scrollview.showsHorizontalScrollIndicator = true
        scrollview.contentSize = CGSize(width: UIScreen.main.bounds.width * 1.3, height: UIScreen.main.bounds.height * 1.3)
        return scrollview
    }()
    private let contentView = UIImageView()
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

    // MARK: - life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
