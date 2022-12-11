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
    private lazy var nextButton: GotoSomewhereButton = {
        let button = GotoSomewhereButton(type: .white)
        let action = UIAction { [weak self] _ in
            self?.presentReactionViewController()
        }
        button.addAction(action, for: .touchUpInside)
        button.setupButtonContents(buttonImage: ImageLiteral.icArrowRight, buttonTitle: StringLiteral.finishReadButtonText)
        return button
    }()
    private let backgroundView = UIImageView(image: ImageLiteral.imgBackground)
    private let backButton = BackButton()
    private let titleHeaderView: NewsTitleView = {
        let view = NewsTitleView()
        view.status = .expanded
        return view
    }()
    
    private lazy var tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.didTappedView(_:)))
    private let newsManager = NewsManager.shared

    private var paragraphs: [String] = []
    private var numberOfSentences: [Int] = []
    private var currentSentenceIndex: Int = 0

    private var currentRow: Int? {
        get {
            guard !self.numberOfSentences.isEmpty else { return nil }
            var sum: Int = 0

            for (index, number) in self.numberOfSentences.enumerated() {
                sum += number

                if self.currentSentenceIndex < sum {
                    return index
                }
            }

            return nil
        }
    }

    private var currentIndexPath: IndexPath {
        guard let row = self.currentRow else { return IndexPath(row: 0, section: 0) }
        let indexPath: IndexPath = IndexPath(row: row, section: 0)

        return indexPath
    }

    // MARK: - life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupLayout()
        self.configureUI()
        self.appendParagraphs()
        self.appendNumberOfSentence()
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
    }
    
    private func configureUI() {
        self.view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    private func scrollTo(_ indexPath: IndexPath) {
        self.newsTableView.scrollToRow(at: indexPath, at: .top, animated: true)
    }

    private func appendParagraphs() {
        let _ = self.newsManager.newsContent.components(separatedBy: CharacterSet.newlines)
                                            .filter { $0 != "" }
                                            .compactMap { self.paragraphs.append($0) }
    }

    private func appendNumberOfSentence() {
        let _ = self.paragraphs.map {
            $0.components(separatedBy: [".", "!", "?"])
              .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
              .filter { !$0.isEmpty }
            }
            .compactMap { self.numberOfSentences.append($0.count) }
    }
    
    private func presentGuideViewController() {
        guard !UserDefaultStorage.isSeenGuide else { return }
        
        let guideViewController = NewsGuideViewController()
        guideViewController.modalTransitionStyle = .crossDissolve
        guideViewController.modalPresentationStyle = .overCurrentContext
        self.present(guideViewController, animated: true)
    }

    private func presentReactionViewController() {
        let reactionViewController = ReactionViewController()
        reactionViewController.modalTransitionStyle = .crossDissolve
        reactionViewController.modalPresentationStyle = .overCurrentContext
        self.present(reactionViewController, animated: true)
    }

    private func removeHighlight() {
        let _ = self.newsTableView.visibleCells.map { $0.isHighlighted = false }
    }
    
    // MARK: - selector
    
    @objc
    private func didTappedView(_ gestureRecognizer: UITapGestureRecognizer) {
        self.titleHeaderView.status = .scrolled
        self.removeHighlight()

        if gestureRecognizer.state == UIGestureRecognizer.State.recognized {
            guard let contentCell = self.newsTableView.cellForRow(at: self.currentIndexPath) as? NewsContentTableViewCell else { return }
            contentCell.isHighlighted = true

            let location = gestureRecognizer.location(in: gestureRecognizer.view)
            switch location.y {
            case 0...Size.halfOfScreenWidth:
                print(self.currentSentenceIndex)
                guard self.currentSentenceIndex >= 0 else {
                    self.titleHeaderView.status = .expanded
                    return
                }
                self.currentSentenceIndex -= 1
                contentCell.shiftHighlight(to: .upper)
            default:
                guard self.currentSentenceIndex < self.numberOfSentences.reduce(0, +) - 1 else { return }
                self.currentSentenceIndex += 1
                contentCell.shiftHighlight(to: .lower)
            }

            self.scrollTo(self.currentIndexPath)
        }
    }
}

// MARK: - UITableViewDataSource
extension ReadingNewsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.paragraphs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsContentTableViewCell.className) as? NewsContentTableViewCell else { return UITableViewCell() }
        let paragraphIndex = indexPath.row + 1

        cell.setupContentParagraphData(paragraphIndex: paragraphIndex, content: self.paragraphs[indexPath.row])
        
        return cell
    }
}
