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
    private lazy var newsTitleView: UILabel = {
        let label = UILabel()
        label.text = self.newsManager.newsTitle
        label.font = .font(.bold, ofSize: 34)
        label.textAlignment = .center
        label.textColor = .evyWhite
        return label
    }()
    private lazy var newsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = self.newsManager.newsImage
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
//    private lazy var timerLabel: UILabel = {
//        let label = UILabel()
//        label.text = "\(newsGuessingTime)"
//        label.textColor = .evyWhite
//        label.textAlignment = .center
//        label.font = .font(.regular, ofSize: 24)
//        return label
//    }()
    private lazy var nextButton: GotoSomewhereButton = {
        let button = GotoSomewhereButton(type: .white)
        let action = UIAction { [weak self] _ in
            self?.presentReadingNewsViewController()
        }
        button.addAction(action, for: .touchUpInside)
        button.setupButtonContents(buttonImage: ImageLiteral.icArrowRight, buttonTitle: "읽으러가기")
        return button
    }()

    private var timer: Timer?
    private var newsGuessingTime = 5

    private let newsManager = NewsManager.shared

    // MARK: - life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.setupTimer()
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

//        self.view.addSubview(self.timerLabel)
//        self.timerLabel.constraint(top: self.newsImageView.bottomAnchor,
//                                   centerX: self.view.centerXAnchor,
//                                   padding: UIEdgeInsets(top: 80, left: 0, bottom: 0, right: 0))

        self.view.addSubview(self.nextButton)
        self.nextButton.constraint(bottom: self.view.bottomAnchor,
                                   trailing: self.view.trailingAnchor,
                                   padding: UIEdgeInsets(top: 0, left: 0, bottom: 37, right: 56))
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
//        self.timerLabel.text = self.newsGuessingTime.description
    }
}
