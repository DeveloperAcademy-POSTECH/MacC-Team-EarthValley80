//
//  FiveWsAndOneHViewController.swift
//  EarthValley80
//
//  Created by SHIN YOON AH on 2022/10/27.
//

import UIKit

final class FiveWsAndOneHViewController: UIViewController {
    
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
    private lazy var questionView: QuestionView = {
        let view = QuestionView(step: .who)
        let action = UIAction { [weak self] _ in
            guard view.step.rawValue < QuestionView.Step.allCases.count else { return }
            guard let nextStep = QuestionView.Step(rawValue: view.step.rawValue + 1) else { return }
            
            view.updateAnswer(at: view.step.rawValue, to: view.contentTextView.text)
            view.updateConfiguration(with: nextStep)
        }
        view.setupNextAction(action)
        view.delegate = self
        view.questions = [
            "이 기사의 주인공은 누구인가요?",
            "이 기사는 언제 일어난 일인가요?",
            "이 기사는 어디서 일어난 일인가요?",
            "무엇 때문에 일어난 일인가요?",
            "어떻게 일어난 일인가요?",
            "왜 이런일이 일어났나요?"
        ]
        return view
    }()
    private let backgroundView = UIImageView(image: ImageLiteral.cardSicL3)
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
        self.view.addSubview(self.backgroundView)
        self.backgroundView.constraint(to: self.view)
        
        self.view.addSubview(self.questionView)
        self.questionView.constraint(top: self.view.topAnchor,
                                     bottom: self.view.bottomAnchor,
                                     trailing: self.view.trailingAnchor,
                                     padding: UIEdgeInsets(top: Size.verticalPadding, left: 0, bottom: Size.verticalPadding, right: 16))
        
        self.view.addSubview(self.backButton)
        self.backButton.constraint(top: self.view.topAnchor,
                                   leading: self.view.leadingAnchor,
                                   padding: UIEdgeInsets(top: 26, left: 10, bottom: 0, right: 0))
        
        self.view.addSubview(self.titleHeaderView)
        self.titleHeaderView.constraint(top: self.backButton.bottomAnchor,
                                        leading: self.view.leadingAnchor,
                                        trailing: self.questionView.leadingAnchor,
                                        padding: UIEdgeInsets(top: 30, left: 0, bottom: 0, right: 10))
        
        self.view.addSubview(self.newsTableView)
        self.newsTableView.constraint(top: self.titleHeaderView.bottomAnchor,
                                      leading: self.view.leadingAnchor,
                                      bottom: self.view.bottomAnchor,
                                      trailing: self.questionView.leadingAnchor,
                                      padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10))
    }
    
    private func configureUI() {
        // TODO: - background gradient Color가 나오면 적용
        self.view.backgroundColor = .black
    }
}

// MARK: - UITableViewDataSource
extension FiveWsAndOneHViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsContentTableViewCell.className) as? NewsContentTableViewCell else { return UITableViewCell() }
        cell.status = .compact
        return cell
    }
}

// MARK: - QuestionViewDelegate
extension FiveWsAndOneHViewController: QuestionViewDelegate {
    func questionView(_ questionView: QuestionView, goTo step: QuestionView.Step) {
        switch step {
        case .infer:
            return
        case .reading:
            self.dismiss(animated: false, completion: { [weak self] in
                self?.dismissQuestionView?()
            })
        default:
            guard questionView.step.rawValue >= 0 else { return }
            guard let previousStep = QuestionView.Step(rawValue: questionView.step.rawValue) else { return }
            
            questionView.updateConfiguration(with: previousStep)
        }
    }
}
