//
//  MainSentenceViewController.swift
//  EarthValley80
//
//  Created by SHIN YOON AH on 2022/10/27.
//

import UIKit

final class MainSentenceViewController: UIViewController {
    
    private enum Size {
        static let verticalPadding: CGFloat = 16.0
        static let questionViewFrameWidth: CGFloat = UIScreen.main.bounds.size.width * 0.48
    }
    
    var dismissQuestionView: (() -> ())?
    
    // MARK: - property
    
    private lazy var newsTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.dataSource = self
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
    private let backgroundView = UIImageView(image: ImageLiteral.icArrowLeft)
    private let backButton = BackButton()
    private let titleHeaderView = NewsTitleView(status: .compact)
    
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
        // TODO: - background gradient Color가 나오면 적용
        self.view.backgroundColor = .black
    }
}

// MARK: - UITableViewDataSource
extension MainSentenceViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsContentTableViewCell.className) as? NewsContentTableViewCell else { return UITableViewCell() }
        cell.status = .compact
        return cell
    }
}
