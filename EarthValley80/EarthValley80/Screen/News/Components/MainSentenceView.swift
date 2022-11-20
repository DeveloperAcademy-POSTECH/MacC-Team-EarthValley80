//
//  MainSentenceView.swift
//  EarthValley80
//
//  Created by SHIN YOON AH on 2022/11/18.
//

import UIKit

final class MainSentenceView: UIView {

    private enum Size {
        static let height: CGFloat = 634.adjustedHeight
        static let width: CGFloat = 573.adjustedWidth
        static let verticalSpacing: CGFloat = 10.0
    }

    // MARK: - property

    private lazy var sentenceTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.dataSource = self
        tableView.backgroundColor = .red
        tableView.separatorColor = .clear
        tableView.indicatorStyle = .white
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.register(cell: MainSentenceTableViewCell.self)

        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 0
        }

        return tableView
    }()

    // MARK: - init

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupLayout()
        self.configureUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - func

    private func setupLayout() {
        self.constraint(.heightAnchor, constant: Size.height)
        self.constraint(.widthAnchor, constant: Size.width)

        self.addSubview(self.sentenceTableView)
        self.sentenceTableView.constraint(to: self,
                                          insets: UIEdgeInsets(top: Size.verticalSpacing, left: 0, bottom: -Size.verticalSpacing, right: 0))
    }

    private func configureUI() {
        self.backgroundColor = .white
        self.layer.cornerRadius = 30
        self.layer.masksToBounds = true
    }
}

// MARK: - UITableViewDataSource
extension MainSentenceView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withType: MainSentenceTableViewCell.self, for: indexPath)
        return cell
    }
}
