//
//  SummaryPopupView.swift
//  EarthValley80
//
//  Created by LeeJiSoo on 2022/12/12.
//

import UIKit

final class SummaryPopupView: UIView {

    private enum Size {
        static let stackViewSpacing: CGFloat = 10.0
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
    private let newsTitleLabel: UILabel = {
        let label = UILabel()
        label.text = StringLiteral.popUpNewsTitle
        label.font = .font(.bold, ofSize: Size.captionFontSize)
        label.textColor = .evyGray1
        return label
    }()
    private var newsTitleContentLabel: UILabel = {
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
    private let mySummaryTitleLabel: UILabel = {
        let label = UILabel()
        label.text = StringLiteral.popUpMySummaryTitle
        label.font = .font(.bold, ofSize: Size.captionFontSize)
        label.textColor = .evyGray1
        return label
    }()
    private var mySummaryContentLabel: UILabel = {
        let label = UILabel()
        // TODO: - 더미데이터입니다. 나중에 지우겠습니다.
        label.text = "타다 앱서비스가 2019년 10월에 법원에서 재판을 했다. 치열하게 3년동안 싸웠는데 무면허 택시일 수도 있어서 그랬다."
        label.textColor = .evyBlack1
        label.font = .font(.bold, ofSize: Size.contentsFontSize)
        label.numberOfLines = 0
        label.lineBreakStrategy = .hangulWordPriority
        return label
    }()
    private let modifySummaryButton = GotoSomewhereButton()

    // MARK: - init

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureUI()
        self.setupLayout()
        self.setupButton()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - func

    private func configureUI() {
        self.backgroundColor = .evyWhite
        self.layer.cornerRadius = 16
    }

    private func setupButton() {
        self.modifySummaryButton.setupButtonContents(buttonImage: ImageLiteral.icoCheck,
                                                     buttonTitle: StringLiteral.modifySummaryButtonText)
    }

    private func setupLayout() {
        self.constraint(.widthAnchor, constant: 800.adjustedWidth)
        self.constraint(.heightAnchor, constant: 733.adjustedHeight)

        self.addSubview(self.sheetStackView)
        self.sheetStackView.constraint(top: self.topAnchor,
                                       leading: self.leadingAnchor,
                                       trailing: self.trailingAnchor,
                                       padding: UIEdgeInsets(top: Size.sheetStackViewPadding,
                                                             left: Size.sheetStackViewPadding,
                                                             bottom: 0,
                                                             right: Size.sheetStackViewPadding))

        self.sheetStackView.addArrangedSubview(self.newsTitleStackView)
        self.sheetStackView.addArrangedSubview(self.newsTitleStackView)
        self.sheetStackView.addArrangedSubview(self.mySummaryStackView)

        self.newsTitleStackView.addArrangedSubview(self.newsTitleLabel)
        self.newsTitleStackView.addArrangedSubview(self.newsTitleContentLabel)

        self.newsTitleStackView.addArrangedSubview(self.newsTitleLabel)
        self.newsTitleStackView.addArrangedSubview(self.newsTitleContentLabel)

        self.mySummaryStackView.addArrangedSubview(self.mySummaryTitleLabel)
        self.mySummaryStackView.addArrangedSubview(self.mySummaryContentLabel)

        self.sheetStackView.setCustomSpacing(53, after: self.newsTitleStackView)
        self.sheetStackView.setCustomSpacing(75, after: self.newsTitleStackView)

        self.addSubview(self.modifySummaryButton)
        self.modifySummaryButton.constraint(bottom: self.bottomAnchor,
                                            trailing: self.trailingAnchor,
                                            padding: UIEdgeInsets(top: 0, left: 0, bottom: 30, right: 30))
    }

    func setupLabel(newsTitle: String, mySummary: String) {
        self.newsTitleContentLabel.text = newsTitle
        self.mySummaryContentLabel.text = mySummary
    }
}
