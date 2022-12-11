//
//  SummaryCompletionViewController.swift
//  EarthValley80
//
//  Created by SHIN YOON AH on 2022/11/20.
//

import UIKit

final class SummaryCompletionViewController: UIViewController {

    // MARK: - property

    private let titleView: CapsuleFormTitleView = CapsuleFormTitleView(title: StringLiteral.summaryCompletionTitle)
    private let celebrateImageView: UIImageView = {
        let imageView = UIImageView(image: ImageLiteral.imgCongrate)
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .font(.regular, ofSize: 16)
        label.textColor = .evyWhite
        label.text = StringLiteral.summaryCompletionDescription
        return label
    }()
    private lazy var nextButton: GotoSomewhereButton = {
        let button = GotoSomewhereButton(type: .white)
        let action = UIAction { [weak self] _ in
            guard let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else { return }
            self?.resetNewsData()
            sceneDelegate.navigateToMyNewsDrawerViewController()
        }
        button.addAction(action, for: .touchUpInside)
        // TODO: - 이 부분 텍스트를 디자인에서 정해주지 않았어요
        button.setupButtonContents(buttonImage: ImageLiteral.icArrowRight, buttonTitle: StringLiteral.goToNewsDrawerButtonText)
        return button
    }()

    private let newsManager = NewsManager.shared

    // MARK: - life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupLayout()
        self.configureUI()
    }

    // MARK: - func

    private func setupLayout() {
        self.view.addSubview(self.titleView)
        self.titleView.constraint(top: self.view.topAnchor,
                                  centerX: self.view.centerXAnchor,
                                  padding: UIEdgeInsets(top: 210.adjustedHeight, left: 0, bottom: 0, right: 0))

        self.view.addSubview(self.celebrateImageView)
        self.celebrateImageView.constraint(top: self.titleView.topAnchor,
                                           centerX: self.view.centerXAnchor,
                                           padding: UIEdgeInsets(top: 8, left: 0, bottom: 0, right: 0))
        self.celebrateImageView.constraint(.widthAnchor, constant: 416.adjustedWidth)
        self.celebrateImageView.constraint(.heightAnchor, constant: 290.adjustedHeight)

        self.view.addSubview(self.descriptionLabel)
        self.descriptionLabel.constraint(top: self.celebrateImageView.bottomAnchor,
                                         centerX: self.view.centerXAnchor,
                                         padding: UIEdgeInsets(top: 30, left: 0, bottom: 0, right: 0))

        self.view.addSubview(self.nextButton)
        self.nextButton.constraint(top: self.descriptionLabel.bottomAnchor,
                                   centerX: self.view.centerXAnchor,
                                   padding: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0))
    }

    private func configureUI() {
        // TODO: - 컬러셋 정해지면 변경
        self.view.backgroundColor = .black.withAlphaComponent(0.94)
    }

    private func resetNewsData() {
        savedNews.append(News(title: newsManager.newsTitle,
                              content: newsManager.newsContent,
                              category: newsManager.newsCategory,
                              image: newsManager.newsImage))
        self.newsManager.resetAll()
    }
}
