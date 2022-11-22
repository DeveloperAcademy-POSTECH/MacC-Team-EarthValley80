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
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .font(.bold, ofSize: 40)
        // TODO: - 컬러셋이 정해지면 제대로 넣어두겠습니다.
        label.textColor = .evyCategoryCul
        return label
    }()

    var paragraphNumber: Int? {
        willSet {
            guard let newValue = newValue else { return }
            self.sentences = Array(repeating: "", count: newValue)
        }
    }
    private var sentences: [String]?

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

        let isSummaryType = type.upperTitle != nil
        isSummaryType ? setupSummaryView() : setupMainSentenceView()
    }

    private func setupMainSentenceView() {
        self.addSubview(self.sentenceTableView)
        self.sentenceTableView.constraint(to: self,
                                          insets: UIEdgeInsets(top: Size.verticalSpacing, left: 0, bottom: -Size.verticalSpacing, right: 0))
    }

    private func setupSummaryView() {
        self.addSubview(self.titleLabel)
        self.titleLabel.constraint(top: self.topAnchor,
                                   leading: self.leadingAnchor,
                                   padding: UIEdgeInsets(top: 40, left: 33, bottom: 0, right: 0))

        self.addSubview(self.sentenceTableView)
        self.sentenceTableView.constraint(top: self.titleLabel.bottomAnchor,
                                          leading: self.leadingAnchor,
                                          bottom: self.bottomAnchor,
                                          trailing: self.trailingAnchor,
                                          padding: UIEdgeInsets(top: 40, left: 0, bottom: Size.verticalSpacing, right: 0))
    }

    private func configureUI(type: ViewType) {
        self.backgroundColor = .white
        self.layer.cornerRadius = type.cornerRadius
        self.layer.masksToBounds = true

        if let title = type.upperTitle {
            self.titleLabel.text = title
            self.titleLabel.setLineSpacing(kernValue: -1.0)
        }
    }
}

// MARK: - UITableViewDataSource
extension MainSentenceView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let sentences = self.sentences else { return 0 }
        return sentences.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MainSentenceTableViewCell = tableView.dequeueReusableCell(withType: MainSentenceTableViewCell.self, for: indexPath)
        
        if let sentences = self.sentences {
            let paragraphIndex = indexPath.row + 1
            
            cell.setupCellData(index: paragraphIndex, content: sentences[indexPath.row])
        }

        return cell
    }
}
