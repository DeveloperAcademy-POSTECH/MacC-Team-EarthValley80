//
//  SummaryPopupViewController.swift
//  EarthValley80
//
//  Created by LeeJiSoo on 2022/11/07.
//

import UIKit

final class SummaryPopupViewController: UIViewController {

    // MARK: - property

    private let sheetStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()
    private let newsTitleStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    private let newstitleCaptionLabel: UILabel = {
        let label = UILabel()
        label.text = StringLiteral.newstitleCaptionTitle
        label.font = .font(.bold, ofSize: 12)
        label.textColor = .evyGray1
        return label
    }()
    private let newsTitleLabel: UILabel = {
        let label = UILabel()
        // TODO: - 더미데이터입니다. 나중에 지우겠습니다.
        label.text = "인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장"
        label.textColor = .evyBlack2
        label.font = .font(.bold, ofSize: 20)
        label.numberOfLines = 0
        return label
    }()
    private let myPredictionStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    private let myPredictionCaptionLabel: UILabel = {
        let label = UILabel()
        label.text = StringLiteral.myPredictionCaptionTitle
        label.font = .font(.bold, ofSize: 20)
        label.textColor = .evyGray1
        return label
    }()
    private let myPredictionLabel: UILabel = {
        let label = UILabel()
        // TODO: - 더미데이터입니다. 나중에 지우겠습니다.
        label.text = "새로운 로봇"
        label.textColor = .evyBlack1
        label.font = .font(.bold, ofSize: 40)
        label.numberOfLines = 0
        return label
    }()
    private let mySummaryStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    private let mySummaryCaptionLabel: UILabel = {
        let label = UILabel()
        label.text = StringLiteral.mySummaryCaptionTitle
        label.font = .font(.bold, ofSize: 20)
        label.textColor = .evyGray1
        return label
    }()
    private let mySummaryLabel: UILabel = {
        let label = UILabel()
        // TODO: - 더미데이터입니다. 나중에 지우겠습니다.
        label.text = "타다 앱서비스가 2019년 10월에 법원에서 재판을 했다. 치열하게 3년동안 싸웠는데 무면허 택시일 수도 있어서 그랬다."
        label.textColor = .evyBlack1
        label.font = .font(.bold, ofSize: 40)
        label.numberOfLines = 0
        return label
    }()

    // MARK: - life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupLayout()
    }

}
