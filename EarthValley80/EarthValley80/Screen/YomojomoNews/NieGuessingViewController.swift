//
//  NieGuessingViewController.swift
//  EarthValley80
//
//  Created by LeeJiSoo on 2022/11/22.
//

import UIKit

final class NieGuessingViewController: UIViewController {

    // MARK: - property

    private let titleView: CapsuleFormTitleView = CapsuleFormTitleView(title: StringLiteral.nieGuessingTitle)
    private let newsTitleView: UILabel = {
        let label = UILabel()
        // TODO: - 더미데이터 입니다. 나중에 지우겠습니다.
        label.text = "세상에 다람쥐가 없다고 무슨 문제야?"
        label.font = .font(.bold, ofSize: 34)
        label.textAlignment = .center
        label.textColor = .evyWhite
        return label
    }()
    private let newsImageView: UIImageView = {
        let imageView = UIImageView()
        // TODO: - 임의로 색상을 넣어두었습니다. 나중에 지우겠습니다.
        imageView.backgroundColor = .orange
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        return imageView
    }()
    private lazy var timerLabel: UILabel = {
        let label = UILabel()
        label.text = "\(newsGuessingTime)"
        label.textColor = .evyWhite
        label.textAlignment = .center
        label.font = .font(.regular, ofSize: 24)
        return label
    }()

    private var timer: Timer?
    private var newsGuessingTime = 5

    // MARK: - life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTimer()
        self.configureUI()
        self.setupLayout()
    }

    // MARK: - func

    private func configureUI() {
        self.view.backgroundColor = .black.withAlphaComponent(0.69)
    }

    private func setupLayout() {
        self.view.addSubview(self.titleView)
        self.titleView.constraint(top: self.view.topAnchor,
                                  centerX: self.view.centerXAnchor,
                                  padding: UIEdgeInsets(top: 210.adjustedHeight, left: 0, bottom: 0, right: 0))

        self.view.addSubview(self.newsTitleView)
        self.newsTitleView.constraint(top: self.titleView.bottomAnchor,
                                      centerX: self.view.centerXAnchor,
                                      padding: UIEdgeInsets(top: 30, left: 0, bottom: 0, right: 0))

        self.view.addSubview(self.newsImageView)
        self.newsImageView.constraint(top: self.newsTitleView.bottomAnchor,
                                      centerX: self.view.centerXAnchor,
                                      padding: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0))
        self.newsImageView.constraint(.widthAnchor, constant: 340.adjustedWidth)
        self.newsImageView.constraint(.heightAnchor, constant: 272.adjustedHeight)

        self.view.addSubview(self.timerLabel)
        self.timerLabel.constraint(top: self.newsImageView.bottomAnchor,
                                   centerX: self.view.centerXAnchor,
                                   padding: UIEdgeInsets(top: 80, left: 0, bottom: 0, right: 0))
    }

    private func setupTimer() {
        self.timer = Timer.scheduledTimer(timeInterval: 1.0,
                                          target: self,
                                          selector: #selector(self.updateTimer),
                                          userInfo: nil,
                                          repeats: true)
    }

    private func presentReadingNewsViewController() {
        let storyboard = UIStoryboard(name: "News", bundle: nil)
        guard let newsViewController = storyboard.instantiateViewController(withIdentifier: ReadingNewsViewController.className) as? ReadingNewsViewController else { return }

        newsViewController.modalTransitionStyle = .crossDissolve
        newsViewController.modalPresentationStyle = .fullScreen

        self.present(newsViewController, animated: true)
    }

    // MARK: - selector

    @objc
    private func updateTimer() {
        guard self.newsGuessingTime != 0 else {
            self.timer?.invalidate()
            self.timer = nil
            self.presentReadingNewsViewController()
            return
        }

        self.newsGuessingTime -= 1
        self.timerLabel.text = self.newsGuessingTime.description
    }
}
