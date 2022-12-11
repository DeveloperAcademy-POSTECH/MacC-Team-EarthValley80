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
        tableView.delegate = self
        tableView.backgroundColor = .clear
        tableView.separatorColor = .clear
        tableView.indicatorStyle = .white
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 128, right: 0)
        tableView.register(cell: MainContentParagraphTableViewCell.self)
        
        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 0
        }
        
        return tableView
    }()
    private let backgroundView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiteral.imgBackground
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
    private let backButton = BackButton()
    private let mainSentenceView = MainSentenceView(type: .mainSentence)
    private lazy var nextButton: GotoSomewhereButton = {
        let button = GotoSomewhereButton(type: .white)
        let action = UIAction { [weak self] _ in
            self?.newsManager.setupMainSentences(self?.mainSentenceView.sentences ?? [])
            self?.presentSummaryViewController()
        }
        button.addAction(action, for: .touchUpInside)
        // TODO: - 이 부분 텍스트를 디자인에서 정해주지 않았어요
        button.setupButtonContents(buttonImage: ImageLiteral.icArrowRight, buttonTitle: StringLiteral.nextButtonText)
        button.isHidden = true
        return button
    }()

    private var enteredViewFirstTime: Bool = true
    private var paragraphs: [String] = [] {
        willSet {
            self.mainSentenceView.paragraphNumber = newValue.count
        }
    }
    
    private let newsManager = NewsManager.shared
    
    // MARK: - life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupLayout()
        self.appendParagraphs()
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

        self.view.addSubview(self.nextButton)
        self.nextButton.constraint(bottom: self.view.bottomAnchor,
                                   trailing: self.view.trailingAnchor,
                                   padding: UIEdgeInsets(top: 0, left: 0, bottom: 37, right: 56))
    }

    private func presentSummaryViewController() {
        let summaryViewController = SummaryViewController()
        summaryViewController.modalTransitionStyle = .crossDissolve
        summaryViewController.modalPresentationStyle = .fullScreen
        self.present(summaryViewController, animated: true)
    }

    private func appendParagraphs() {
        let _ = self.newsManager.newsContent.components(separatedBy: CharacterSet.newlines)
                                            .filter { $0 != "" }
                                            .compactMap { self.paragraphs.append($0) }
    }
}

// MARK: - UITableViewDataSource
extension MainSentenceViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.paragraphs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainContentParagraphTableViewCell.className) as? MainContentParagraphTableViewCell else { return UITableViewCell() }
        let paragraphIndex = indexPath.row + 1
        let enteredFirstTime = indexPath.row == 0 && self.enteredViewFirstTime

        cell.setupContentParagraphData(paragraphIndex: paragraphIndex, content: self.paragraphs[indexPath.row])
        cell.didTappedMainSentence = { [weak self] sentence in
            guard let mainSentenceView = self?.mainSentenceView else { return }
            mainSentenceView.putMainSentence(at: indexPath.row, sentence: sentence)

            if let sentence = mainSentenceView.sentences,
               !sentence.contains("") {
                self?.nextButton.isHidden = false
            }
        }

        if enteredFirstTime {
            self.enteredViewFirstTime = false
            tableView.selectRow(at: indexPath, animated: false, scrollPosition: .none)
        }

        return cell
    }
}

// MARK: - UITableViewDelegate
extension MainSentenceViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? MainContentParagraphTableViewCell else { return }
        cell.isSelected = true

        tableView.scrollToRow(at: indexPath, at: .top, animated: true)
    }

    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? MainContentParagraphTableViewCell else { return }
        cell.isSelected = false
    }
}
