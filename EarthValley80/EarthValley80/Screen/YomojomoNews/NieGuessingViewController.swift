//
//  NieGuessingViewController.swift
//  EarthValley80
//
//  Created by LeeJiSoo on 2022/11/22.
//

import UIKit

class NieGuessingViewController: UIViewController {

    // MARK: - property

    private let titleView: CapsuleFormTitleView = CapsuleFormTitleView(title: "사진과 기사에서 미루어 보았을때, 이 기사가 어떤 기사인지 5초간 생각해 보아요.")
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

    // MARK: - life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setupLayout()
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

    }

    }
}
