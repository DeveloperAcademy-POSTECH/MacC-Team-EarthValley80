//
//  SelectInterestViewController.swift
//  EarthValley80
//
//  Created by LeeJiSoo on 2022/11/23.
//

import UIKit

class SelectInterestViewController: UIViewController, UIGestureRecognizerDelegate {

    // MARK: - property
    
    private lazy var scrollView: UIScrollView = {
        let scrollview = UIScrollView()
        scrollview.backgroundColor = .evyWhite
        scrollview.showsVerticalScrollIndicator = false
        scrollview.showsHorizontalScrollIndicator = false
        scrollview.contentSize = CGSize(width: UIScreen.main.bounds.width * 1.3, height: UIScreen.main.bounds.height * 1.3)
        return scrollview
    }()
    private let greetingLabel: UILabel = {
        let label = UILabel()
        label.text = StringLiteral.greetingTitle  
        label.font = .font(.regular, ofSize: 12)
        return label
    }()
    private let selectGuideTitleLabel: UILabel = {
        let label = UILabel()
        label.text = StringLiteral.selectGuideTitle
        label.font = .font(.title, ofSize: 40)
        label.numberOfLines = 0
        return label
    }()
    private let society: CategoryShapeView = CategoryShapeView(image: ImageLiteral.society, labelText: "사회")
    private let world: CategoryShapeView = CategoryShapeView(image: ImageLiteral.world, labelText: "세계")
    private let history: CategoryShapeView = CategoryShapeView(image: ImageLiteral.history, labelText: "역사")
    private let robot: CategoryShapeView = CategoryShapeView(image: ImageLiteral.robot, labelText: "로봇")
    private let environment: CategoryShapeView = CategoryShapeView(image: ImageLiteral.environment, labelText: "환경")
    private let health: CategoryShapeView = CategoryShapeView(image: ImageLiteral.health, labelText: "건강")
    private let animal: CategoryShapeView = CategoryShapeView(image: ImageLiteral.animal, labelText: "동물")
    private let space: CategoryShapeView = CategoryShapeView(image: ImageLiteral.space, labelText: "우주")
    private let science: CategoryShapeView = CategoryShapeView(image: ImageLiteral.science, labelText: "과학")
    private let company: CategoryShapeView = CategoryShapeView(image: ImageLiteral.company, labelText: "회사")
    private let money: CategoryShapeView = CategoryShapeView(image: ImageLiteral.money, labelText: "돈")
    private let economyIT: CategoryShapeView = CategoryShapeView(image: ImageLiteral.economyIT, labelText: "IT")
    private let economy: CategoryShapeView = CategoryShapeView(image: ImageLiteral.economy, labelText: "경제")
    private let art: CategoryShapeView = CategoryShapeView(image: ImageLiteral.art, labelText: "예술")
    private let broadcast: CategoryShapeView = CategoryShapeView(image: ImageLiteral.broadcast, labelText: "방송")
    private let exercise: CategoryShapeView = CategoryShapeView(image: ImageLiteral.exercise, labelText: "운동")
    private let culture: CategoryShapeView = CategoryShapeView(image: ImageLiteral.culture, labelText: "문화")

    // MARK: - life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }

    // MARK: - func

    private func setupLayout() {
        self.view.addSubview(self.scrollView)
        self.scrollView.constraint(top: self.view.topAnchor,
                                   leading: self.view.leadingAnchor,
                                   bottom: self.view.bottomAnchor,
                                   trailing: self.view.trailingAnchor,
                                   padding: UIEdgeInsets.zero)

        self.scrollView.addSubview(self.society)
        self.society.constraint(top: self.scrollView.topAnchor,
                                leading: self.scrollView.leadingAnchor,
                                padding: UIEdgeInsets(top: 366.adjustedHeight, left: 49.adjustedWidth, bottom: 0, right: 0))
        self.society.constraint(.widthAnchor, constant: 200.adjustedWidth)
        self.society.constraint(.heightAnchor, constant: 200.adjustedHeight)

        self.scrollView.addSubview(self.animal)
        self.animal.constraint(top: self.scrollView.topAnchor,
                               leading: self.scrollView.leadingAnchor,
                               padding: UIEdgeInsets(top: 404.adjustedHeight, left: 282.adjustedWidth, bottom: 0, right: 0))
        self.animal.constraint(.widthAnchor, constant: 200.adjustedWidth)
        self.animal.constraint(.heightAnchor, constant: 200.adjustedHeight)

        self.scrollView.addSubview(self.broadcast)
        self.broadcast.constraint(top: self.scrollView.topAnchor,
                                  leading: self.scrollView.leadingAnchor,
                                  padding: UIEdgeInsets(top: 588.adjustedHeight, left: 168.adjustedWidth, bottom: 0, right: 0))
        self.broadcast.constraint(.widthAnchor, constant: 200.adjustedWidth)
        self.broadcast.constraint(.heightAnchor, constant: 200.adjustedHeight)

        self.scrollView.addSubview(self.money)
        self.money.constraint(top: self.scrollView.topAnchor,
                              leading: self.scrollView.leadingAnchor,
                              padding: UIEdgeInsets(top: 600.adjustedHeight, left: 390.adjustedWidth, bottom: 0, right: 0))
        self.money.constraint(.widthAnchor, constant: 200.adjustedWidth)
        self.money.constraint(.heightAnchor, constant: 200.adjustedHeight)

        self.scrollView.addSubview(self.art)
        self.art.constraint(top: self.scrollView.topAnchor,
                            leading: self.scrollView.leadingAnchor,
                            padding: UIEdgeInsets(top: 322.adjustedHeight, left: 485.adjustedWidth, bottom: 0, right: 0))
        self.art.constraint(.widthAnchor, constant: 200.adjustedWidth)
        self.art.constraint(.heightAnchor, constant: 200.adjustedHeight)

        self.scrollView.addSubview(self.environment)
        self.environment.constraint(top: self.scrollView.topAnchor,
                                    leading: self.scrollView.leadingAnchor,
                                    padding: UIEdgeInsets(top: 763.adjustedHeight, left: 270.adjustedWidth, bottom: 0, right: 0))
        self.environment.constraint(.widthAnchor, constant: 200.adjustedWidth)
        self.environment.constraint(.heightAnchor, constant: 200.adjustedHeight)

        self.scrollView.addSubview(self.culture)
        self.culture.constraint(top: self.scrollView.topAnchor,
                                leading: self.scrollView.leadingAnchor,
                                padding: UIEdgeInsets(top: 514.adjustedHeight, left: 569.adjustedWidth, bottom: 0, right: 0))
        self.culture.constraint(.widthAnchor, constant: 200.adjustedWidth)
        self.culture.constraint(.heightAnchor, constant: 200.adjustedHeight)

        self.scrollView.addSubview(self.history)
        self.history.constraint(top: self.scrollView.topAnchor,
                                leading: self.scrollView.leadingAnchor,
                                padding: UIEdgeInsets(top: 689.adjustedHeight, left: 554.adjustedWidth, bottom: 0, right: 0))
        self.history.constraint(.widthAnchor, constant: 200.adjustedWidth)
        self.history.constraint(.heightAnchor, constant: 200.adjustedHeight)

        self.scrollView.addSubview(self.health)
        self.health.constraint(top: self.scrollView.topAnchor,
                               leading: self.scrollView.leadingAnchor,
                               padding: UIEdgeInsets(top: 140.adjustedHeight, left: 840.adjustedWidth, bottom: 0, right: 0))
        self.health.constraint(.widthAnchor, constant: 200.adjustedWidth)
        self.health.constraint(.heightAnchor, constant: 200.adjustedHeight)

        self.scrollView.addSubview(self.company)
        self.company.constraint(top: self.scrollView.topAnchor,
                                leading: self.scrollView.leadingAnchor,
                                padding: UIEdgeInsets(top: 352.adjustedHeight, left: 747.adjustedWidth, bottom: 0, right: 0))
        self.company.constraint(.widthAnchor, constant: 200.adjustedWidth)
        self.company.constraint(.heightAnchor, constant: 200.adjustedHeight)

        self.scrollView.addSubview(self.science)
        self.science.constraint(top: self.scrollView.topAnchor,
                                leading: self.scrollView.leadingAnchor,
                                padding: UIEdgeInsets(top: 543.adjustedHeight, left: 773.adjustedWidth, bottom: 0, right: 0))
        self.science.constraint(.widthAnchor, constant: 200.adjustedWidth)
        self.science.constraint(.heightAnchor, constant: 200.adjustedHeight)

        self.scrollView.addSubview(self.economyIT)
        self.economyIT.constraint(top: self.scrollView.topAnchor,
                                  leading: self.scrollView.leadingAnchor,
                                  padding: UIEdgeInsets(top: 720.adjustedHeight, left: 800.adjustedWidth, bottom: 0, right: 0))
        self.economyIT.constraint(.widthAnchor, constant: 200.adjustedWidth)
        self.economyIT.constraint(.heightAnchor, constant: 200.adjustedHeight)

        self.scrollView.addSubview(self.exercise)
        self.exercise.constraint(top: self.scrollView.topAnchor,
                                 leading: self.scrollView.leadingAnchor,
                                 padding: UIEdgeInsets(top: 300.adjustedHeight, left: 1000.adjustedWidth, bottom: 0, right: 0))
        self.exercise.constraint(.widthAnchor, constant: 200.adjustedWidth)
        self.exercise.constraint(.heightAnchor, constant: 200.adjustedHeight)

        self.scrollView.addSubview(self.world)
        self.world.constraint(top: self.scrollView.topAnchor,
                              leading: self.scrollView.leadingAnchor,
                              padding: UIEdgeInsets(top: 490.adjustedHeight, left: 971.adjustedWidth, bottom: 0, right: 0))
        self.world.constraint(.widthAnchor, constant: 200.adjustedWidth)
        self.world.constraint(.heightAnchor, constant: 200.adjustedHeight)

        self.scrollView.addSubview(self.robot)
        self.robot.constraint(top: self.scrollView.topAnchor,
                              leading: self.scrollView.leadingAnchor,
                              padding: UIEdgeInsets(top: 220.adjustedHeight, left: 1200.adjustedWidth, bottom: 0, right: 0))
        self.robot.constraint(.widthAnchor, constant: 200.adjustedWidth)
        self.robot.constraint(.heightAnchor, constant: 200.adjustedHeight)

        self.scrollView.addSubview(self.economy)
        self.economy.constraint(top: self.scrollView.topAnchor,
                                leading: self.scrollView.leadingAnchor,
                                padding: UIEdgeInsets(top: 457.adjustedHeight, left: 1185.adjustedWidth, bottom: 0, right: 0))
        self.economy.constraint(.widthAnchor, constant: 200.adjustedWidth)
        self.economy.constraint(.heightAnchor, constant: 200.adjustedHeight)

        self.scrollView.addSubview(self.space)
        self.space.constraint(top: self.scrollView.topAnchor,
                              leading: self.scrollView.leadingAnchor,
                              padding: UIEdgeInsets(top: 670.adjustedHeight, left: 1050.adjustedWidth, bottom: 0, right: 0))
        self.space.constraint(.widthAnchor, constant: 200.adjustedWidth)
        self.space.constraint(.heightAnchor, constant: 200.adjustedHeight)

        self.scrollView.addSubview(self.greetingLabel)
        self.greetingLabel.constraint(top: self.view.topAnchor,
                                   leading: self.view.leadingAnchor,
                                   padding: UIEdgeInsets(top: 60.adjustedHeight, left: 40.adjustedWidth, bottom: 0, right: 0))

        self.scrollView.addSubview(self.selectGuideTitleLabel)
        self.selectGuideTitleLabel.constraint(top: self.greetingLabel.bottomAnchor,
                                 leading: self.greetingLabel.leadingAnchor,
                                 padding: UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0))
    }
}
