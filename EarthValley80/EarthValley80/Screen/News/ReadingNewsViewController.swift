//
//  ReadingNewsViewController.swift
//  EarthValley80
//
//  Created by SHIN YOON AH on 2022/10/25.
//

import UIKit

final class ReadingNewsViewController: UIViewController {
    
    // MARK: - property
    
    private let backButton: UIButton = {
        let button = UIButton()
        // TODO: - 홈으로 이미지 적용
        button.setBackgroundColor(.blue, for: .normal)
        return button
    }()
    private let captionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .bold)
        label.text = "기사 읽기"
        label.textColor = .white.withAlphaComponent(0.5)
        return label
    }()
    private lazy var newsTableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .systemPink
        return tableView
    }()
    
    // MARK: - life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        configureUI()
    }
    
    // MARK: - func
    
    private func setupLayout() {
        view.addSubview(backButton)
        backButton.constraint(top: view.topAnchor,
                              leading: view.leadingAnchor,
                              padding: UIEdgeInsets(top: 26, left: 10, bottom: 0, right: 0))
        backButton.constraint(.heightAnchor, constant: 44)
        backButton.constraint(.widthAnchor, constant: 107)
        
        view.addSubview(captionLabel)
        captionLabel.constraint(top: view.topAnchor,
                                leading: view.leadingAnchor,
                                padding: UIEdgeInsets(top: 76, left: 96, bottom: 0, right: 0))
        
        view.addSubview(newsTableView)
        newsTableView.constraint(top: captionLabel.bottomAnchor,
                                 leading: view.leadingAnchor,
                                 bottom: view.bottomAnchor,
                                 trailing: view.trailingAnchor,
                                 padding: UIEdgeInsets(top: 15, left: 0, bottom: 0, right: 0))
    }
    
    private func configureUI() {
        // TODO: - background gradient Color가 나오면 적용
        view.backgroundColor = .black
    }
}

// MARK: - UITableViewDataSource
extension ReadingNewsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

// MARK: - UITableViewDelegate
extension ReadingNewsViewController: UITableViewDelegate {
    
}
