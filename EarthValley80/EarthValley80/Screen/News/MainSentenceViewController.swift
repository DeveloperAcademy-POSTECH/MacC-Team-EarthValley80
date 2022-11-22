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
    private let backgroundView: UIImageView = {
        let imageView = UIImageView()
        // TODO: - 나중에 에셋으로 변경할 예정
        imageView.backgroundColor = .evyBlack2
        return imageView
    }()
    private let captionLabel: UILabel = {
        let label = UILabel()
        label.font = .font(.bold, ofSize: 15)
        label.text = StringLiteral.searchMainSentenceCaptionTitle
        label.textColor = .evyWhite
        return label
    }()
    private let titleHeaderView: NewsTitleView = {
        let view = NewsTitleView()
        view.status = .compact
        return view
    }()
    private let titleView: CapsuleFormTitleView = CapsuleFormTitleView(title: StringLiteral.mainSentenceTitle)
    private let mainSentenceView = MainSentenceView(type: .mainSentence)
    private let backButton = BackButton()
    
    // MARK: - life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupLayout()
    }
    
    // MARK: - func
    
    private func setupLayout() {
        self.view.addSubview(self.backgroundView)
        self.backgroundView.constraint(to: self.view)
        
        self.view.addSubview(self.mainSentenceView)
        self.mainSentenceView.constraint(bottom: self.view.bottomAnchor,
                                         trailing: self.view.trailingAnchor,
                                         padding: UIEdgeInsets(top: 0, left: 0, bottom: Size.verticalPadding, right: 30))

        self.view.addSubview(self.titleView)
        self.titleView.constraint(bottom: self.mainSentenceView.topAnchor,
                                  centerX: self.mainSentenceView.centerXAnchor,
                                  padding: UIEdgeInsets(top: 0, left: 0, bottom: 38, right: 0))
        
        self.view.addSubview(self.backButton)
        self.backButton.constraint(top: self.view.topAnchor,
                                   leading: self.view.leadingAnchor,
                                   padding: UIEdgeInsets(top: 26, left: 10, bottom: 0, right: 0))

        self.view.addSubview(self.captionLabel)
        self.captionLabel.constraint(top: self.view.topAnchor,
                                     centerX: self.view.centerXAnchor,
                                     padding: UIEdgeInsets(top: 40, left: 0, bottom: 0, right: 0))
        
        self.view.addSubview(self.titleHeaderView)
        self.titleHeaderView.constraint(top: self.backButton.bottomAnchor,
                                        leading: self.view.leadingAnchor,
                                        trailing: self.mainSentenceView.leadingAnchor,
                                        padding: UIEdgeInsets(top: 30, left: 0, bottom: 0, right: 10))
        self.titleHeaderView.constraint(.heightAnchor, constant: self.titleHeaderView.heightOfLabel)
        
        self.view.addSubview(self.newsTableView)
        self.newsTableView.constraint(top: self.titleHeaderView.bottomAnchor,
                                      leading: self.view.leadingAnchor,
                                      bottom: self.view.bottomAnchor,
                                      trailing: self.mainSentenceView.leadingAnchor,
                                      padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10))
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
