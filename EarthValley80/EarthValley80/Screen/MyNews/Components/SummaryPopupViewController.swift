//
//  SummaryPopupViewController.swift
//  EarthValley80
//
//  Created by LeeJiSoo on 2022/11/07.
//

import UIKit

final class SummaryPopupViewController: UIViewController {

    private enum Size {
        static let stackViewSpacing: CGFloat = 10.0
        static let newstitleCaptionFontSize: CGFloat = 12.0
        static let newsTitleFontSize: CGFloat = 20.0
        static let captionFontSize: CGFloat = 20.0
        static let contentsFontSize: CGFloat = 40.0
        static let sheetStackViewPadding: CGFloat = 40.0
    }

    // MARK: - property

    private let sheetStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()
    private let newsTitleStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = Size.stackViewSpacing
        return stackView
    }()
    private let newstitleCaptionLabel: UILabel = {
        let label = UILabel()
        label.text = StringLiteral.newstitleCaptionTitle
        label.font = .font(.bold, ofSize: Size.newstitleCaptionFontSize)
        label.textColor = .evyGray1
        return label
    }()
    private let newsTitleLabel: UILabel = {
        let label = UILabel()
        // TODO: - 더미데이터입니다. 나중에 지우겠습니다.
        label.text = "인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장"
        label.textColor = .evyBlack2
        label.font = .font(.bold, ofSize: Size.newsTitleFontSize)
        label.numberOfLines = 0
        label.lineBreakStrategy = .hangulWordPriority
        return label
    }()
    private let myPredictionStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = Size.stackViewSpacing
        return stackView
    }()
    private let myPredictionCaptionLabel: UILabel = {
        let label = UILabel()
        label.text = StringLiteral.myPredictionCaptionTitle
        label.font = .font(.bold, ofSize: Size.captionFontSize)
        label.textColor = .evyGray1
        return label
    }()
    private let myPredictionLabel: UILabel = {
        let label = UILabel()
        // TODO: - 더미데이터입니다. 나중에 지우겠습니다.
        label.text = "새로운 로봇"
        label.textColor = .evyBlack1
        label.font = .font(.bold, ofSize: Size.contentsFontSize)
        label.numberOfLines = 0
        label.lineBreakStrategy = .hangulWordPriority
        return label
    }()
    private let mySummaryStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = Size.stackViewSpacing
        return stackView
    }()
    private let mySummaryCaptionLabel: UILabel = {
        let label = UILabel()
        label.text = StringLiteral.mySummaryCaptionTitle
        label.font = .font(.bold, ofSize: Size.captionFontSize)
        label.textColor = .evyGray1
        return label
    }()
    private let mySummaryLabel: UILabel = {
        let label = UILabel()
        // TODO: - 더미데이터입니다. 나중에 지우겠습니다.
        label.text = "타다 앱서비스가 2019년 10월에 법원에서 재판을 했다. 치열하게 3년동안 싸웠는데 무면허 택시일 수도 있어서 그랬다."
        label.textColor = .evyBlack1
        label.font = .font(.bold, ofSize: Size.contentsFontSize)
        label.numberOfLines = 0
        label.lineBreakStrategy = .hangulWordPriority
        return label
    }()

    // MARK: - life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupLayout()
    }

    // MARK: - func

    private func setupLayout() {
        self.view.addSubview(self.sheetStackView)
        self.sheetStackView.constraint(top: self.view.topAnchor,
                                       leading: self.view.leadingAnchor,
                                       trailing: self.view.trailingAnchor,
                                       padding: UIEdgeInsets(top: Size.sheetStackViewPadding,
                                                             left: Size.sheetStackViewPadding,
                                                             bottom: 0,
                                                             right: Size.sheetStackViewPadding))

        self.sheetStackView.addArrangedSubview(self.newsTitleStackView)
        self.sheetStackView.addArrangedSubview(self.myPredictionStackView)
        self.sheetStackView.addArrangedSubview(self.mySummaryStackView)

        self.newsTitleStackView.addArrangedSubview(self.newstitleCaptionLabel)
        self.newsTitleStackView.addArrangedSubview(self.newsTitleLabel)

        self.myPredictionStackView.addArrangedSubview(self.myPredictionCaptionLabel)
        self.myPredictionStackView.addArrangedSubview(self.myPredictionLabel)

        self.mySummaryStackView.addArrangedSubview(self.mySummaryCaptionLabel)
        self.mySummaryStackView.addArrangedSubview(self.mySummaryLabel)

        self.sheetStackView.setCustomSpacing(53, after: self.newsTitleStackView)
        self.sheetStackView.setCustomSpacing(75, after: self.myPredictionStackView)
    }
}
