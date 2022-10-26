//
//  ReadingNewsViewController.swift
//  EarthValley80
//
//  Created by SHIN YOON AH on 2022/10/25.
//

import UIKit

final class ReadingNewsViewController: UIViewController {
    
    private enum Size {
        static let verticalPadding: CGFloat = 16.0
        static let questionViewFrameWidth: CGFloat = UIScreen.main.bounds.size.width * 0.48
        static let partOfQuestionViewFrameWidth = questionViewFrameWidth - 20
    }
    
    // MARK: - property
    
    private let captionLabel: UILabel = {
        let label = UILabel()
        label.font = .font(.bold, ofSize: 12)
        label.lineBreakStrategy = .hangulWordPriority
        label.text = StringLiteral.readingNewsCaptionTitle
        label.textColor = .white.withAlphaComponent(0.5)
        return label
    }()
    private lazy var newsTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .clear
        tableView.separatorColor = .clear
        tableView.indicatorStyle = .white
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 128, right: 0)
        tableView.register(cell: NewsContentTableViewCell.self)
        
        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 0
        }
        
        return tableView
    }()
    private let backButton = BackButton()
    private let titleHeaderView = NewsTitleHeaderView()
    private let questionView = QuestionView()
    
    // MARK: - life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupLayout()
        self.configureUI()
    }
    
    // MARK: - func
    
    private func setupLayout() {
        self.view.addSubview(questionView)
        self.questionView.constraint(top: self.view.topAnchor,
                                     bottom: self.view.bottomAnchor,
                                     trailing: self.view.trailingAnchor,
                                     padding: UIEdgeInsets(top: Size.verticalPadding, left: 0, bottom: Size.verticalPadding, right: -Size.partOfQuestionViewFrameWidth))
        
        self.view.addSubview(self.backButton)
        self.backButton.constraint(top: self.view.topAnchor,
                                   leading: self.view.leadingAnchor,
                                   padding: UIEdgeInsets(top: 26, left: 10, bottom: 0, right: 0))
        
        self.view.addSubview(self.captionLabel)
        self.captionLabel.constraint(top: self.view.topAnchor,
                                     leading: self.view.leadingAnchor,
                                     padding: UIEdgeInsets(top: 76, left: 96, bottom: 0, right: 0))
        
        self.view.addSubview(self.newsTableView)
        self.newsTableView.constraint(top: self.captionLabel.bottomAnchor,
                                      leading: self.view.leadingAnchor,
                                      bottom: self.view.bottomAnchor,
                                      trailing: self.questionView.leadingAnchor,
                                      padding: UIEdgeInsets(top: 15, left: 0, bottom: 0, right: 10))
    }
    
    private func configureUI() {
        // TODO: - background gradient Color가 나오면 적용
        self.view.backgroundColor = .black
    }
}

// MARK: - UITableViewDataSource
extension ReadingNewsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsContentTableViewCell.className) as? NewsContentTableViewCell else { return UITableViewCell() }
        return cell
    }
}

// MARK: - UITableViewDelegate
extension ReadingNewsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return self.titleHeaderView
    }
}
