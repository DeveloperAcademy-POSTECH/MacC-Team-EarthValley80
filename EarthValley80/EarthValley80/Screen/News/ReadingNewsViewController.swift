//
//  ReadingNewsViewController.swift
//  EarthValley80
//
//  Created by SHIN YOON AH on 2022/10/25.
//

import UIKit

final class ReadingNewsViewController: UIViewController {
    
    private enum Size {
        static let halfOfScreenWidth: CGFloat = UIScreen.main.bounds.size.width / 2
        static let disabledButtonWidth: CGFloat = 60.0
        static let enabledButtonWidth: CGFloat = 104.0
    }
    
    // MARK: - property
    
    private let captionLabel: UILabel = {
        let label = UILabel()
        label.font = .font(.bold, ofSize: 15)
        label.text = StringLiteral.readingNewsCaptionTitle
        label.textColor = .evyWhite
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
    private lazy var nextButton: NextButton = {
        let button = NextButton(configType: .disabled, color: .evyWhite)
        let action = UIAction { [weak self] _ in
            // TODO: - 리액션 뷰로 이동 구현
        }
        button.addAction(action, for: .touchUpInside)
        return button
    }()
    private let backgroundView: UIImageView = {
        let imageView = UIImageView()
        // TODO: - 나중에 에셋으로 변경할 예정
        imageView.backgroundColor = .evyBlack2
        return imageView
    }()
    private let backButton = BackButton()
    private let titleHeaderView = NewsTitleView(status: .expanded)
    
    private lazy var tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.didTappedView(_:)))

    // MARK: - life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupLayout()
        self.configureUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.presentGuideViewController()
    }
    
    // MARK: - func
    
    private func setupLayout() {
        self.view.addSubview(self.backgroundView)
        self.backgroundView.constraint(to: self.view)
        
        self.view.addSubview(self.backButton)
        self.backButton.constraint(top: self.view.topAnchor,
                                   leading: self.view.leadingAnchor,
                                   padding: UIEdgeInsets(top: 26, left: 10, bottom: 0, right: 0))
        
        self.view.addSubview(self.captionLabel)
        self.captionLabel.constraint(top: self.view.topAnchor,
                                     centerX: self.view.centerXAnchor,
                                     padding: UIEdgeInsets(top: 40, left: 0, bottom: 0, right: 0))
        
        self.view.addSubview(self.titleHeaderView)
        self.titleHeaderView.constraint(top: self.captionLabel.bottomAnchor,
                                        leading: self.view.leadingAnchor,
                                        trailing: self.view.trailingAnchor,
                                        padding: UIEdgeInsets(top: 66, left: 0, bottom: 0, right: 0))
        self.titleHeaderView.constraint(.heightAnchor, constant: self.titleHeaderView.heightOfLabel)
        
        self.view.addSubview(self.newsTableView)
        self.newsTableView.constraint(top: self.titleHeaderView.bottomAnchor,
                                      leading: self.view.leadingAnchor,
                                      bottom: self.view.bottomAnchor,
                                      trailing: self.view.trailingAnchor)
        
        self.view.addSubview(self.nextButton)
        self.nextButton.constraint(bottom: self.view.bottomAnchor,
                                   trailing: self.view.trailingAnchor,
                                   padding: UIEdgeInsets(top: 0, left: 0, bottom: 37, right: 56))
        self.nextButton.widthAnchorConstraint = self.nextButton.widthAnchor.constraint(equalToConstant: Size.disabledButtonWidth)
    }
    
    private func configureUI() {
        self.view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    private func updateView(with scrollPosition: UITableView.ScrollPosition,
                            indexPath: IndexPath = IndexPath(row: 0, section: 0)) {
        self.newsTableView.scrollToRow(at: indexPath, at: scrollPosition, animated: true)
        
        if scrollPosition == .middle {
            self.nextButton.configType = .next
            self.nextButton.widthAnchorConstraint?.constant = Size.enabledButtonWidth
        }
    }
    
    private func presentGuideViewController() {
        guard !UserDefaultStorage.isSeenGuide else { return }
        
        let guideViewController = NewsGuideViewController()
        guideViewController.modalTransitionStyle = .crossDissolve
        guideViewController.modalPresentationStyle = .overCurrentContext
        self.present(guideViewController, animated: true)
    }
    
    // MARK: - selector
    
    @objc
    private func didTappedView(_ gestureRecognizer: UITapGestureRecognizer) {
        if gestureRecognizer.state == UIGestureRecognizer.State.recognized {
            let indexPath: IndexPath = IndexPath(row: 0, section: 0)
            guard let contentCell = self.newsTableView.cellForRow(at: indexPath) as? NewsContentTableViewCell else { return }
        
            let location = gestureRecognizer.location(in: gestureRecognizer.view)
            switch location.y {
            case 0...Size.halfOfScreenWidth:
                contentCell.shiftHighlight(to: .upper)
            default:
                contentCell.shiftHighlight(to: .lower)
            }
            
            let scrollPosition = contentCell.checkCurrentPosition()
            self.updateView(with: scrollPosition)
        }
    }
}

// MARK: - UITableViewDataSource
extension ReadingNewsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsContentTableViewCell.className) as? NewsContentTableViewCell else { return UITableViewCell() }
        cell.status = .expanded
        return cell
    }
}

// MARK: - UITableViewDelegate
extension ReadingNewsViewController: UITableViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard self.titleHeaderView.status != .compact else { return }
        let offsetY = scrollView.contentOffset.y
        let isScrolled = offsetY > 0
        
        self.titleHeaderView.updateTitleStatus(to: isScrolled ? .scrolled : .expanded)
    }
}
