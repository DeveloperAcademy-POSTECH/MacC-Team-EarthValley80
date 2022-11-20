//
//  MainSentenceView.swift
//  EarthValley80
//
//  Created by SHIN YOON AH on 2022/11/18.
//

import UIKit

final class MainSentenceView: UIView {

    private enum Size {
        static let mainSentenceHeight: CGFloat = 634.adjustedHeight
        static let mainSentenceWidth: CGFloat = 573.adjustedWidth
        static let summaryHeight: CGFloat = 620.adjustedHeight
        static let summaryWidth: CGFloat = 545.adjustedWidth
        static let verticalSpacing: CGFloat = 10.0
    }

    @frozen
    enum ViewType {
        case mainSentence, summary

        var size: CGSize {
            switch self {
            case .mainSentence:
                return CGSize(width: Size.mainSentenceWidth, height: Size.mainSentenceHeight)
            case .summary:
                return CGSize(width: Size.summaryWidth, height: Size.summaryHeight)
            }
        }

        var cornerRadius: CGFloat {
            switch self {
            case .mainSentence:
                return 30.0
            case .summary:
                return 13.0
            }
        }

        var upperTitle: String? {
            switch self {
            case .mainSentence:
                return nil
            case .summary:
                return StringLiteral.myMainSentenceTitle
            }
        }
    }

    // MARK: - property

    private lazy var sentenceTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.dataSource = self
        tableView.separatorColor = .clear
        tableView.indicatorStyle = .white
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 30, right: 0)
        tableView.register(cell: MainSentenceTableViewCell.self)

        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 0
        }

        return tableView
    }()

    // MARK: - init

    init(type: ViewType) {
        super.init(frame: .zero)
        self.setupLayout(type: type)
        self.configureUI(type: type)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - func

    private func setupLayout(type: ViewType) {
        self.constraint(.heightAnchor, constant: type.size.height)
        self.constraint(.widthAnchor, constant: type.size.width)

        self.addSubview(self.sentenceTableView)
        self.sentenceTableView.constraint(to: self,
                                          insets: UIEdgeInsets(top: Size.verticalSpacing, left: 0, bottom: -Size.verticalSpacing, right: 0))
    }

    private func configureUI(type: ViewType) {
        self.backgroundColor = .white
        self.layer.cornerRadius = type.cornerRadius
        self.layer.masksToBounds = true
    }
}

// MARK: - UITableViewDataSource
extension MainSentenceView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MainSentenceTableViewCell = tableView.dequeueReusableCell(withType: MainSentenceTableViewCell.self, for: indexPath)
        let paragraphIndex = indexPath.row + 1

        // TODO: - 나중에 배열을 생성해서 중심문장을 받을 생각입니다.
        cell.setupCellData(index: paragraphIndex, content: "페이스북의 모회사(회사의 경영을 지배하는 회사)인 메타가 직원 1만1000명을 해고한다고 밝혔다.")

        return cell
    }
}
