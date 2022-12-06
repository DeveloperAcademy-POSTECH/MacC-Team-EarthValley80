//
//  SelectInterestViewController.swift
//  EarthValley80
//
//  Created by LeeJiSoo on 2022/11/23.
//

import UIKit

class SelectInterestViewController: UIViewController {

    // MARK: - property
    
    private lazy var scrollView: UIScrollView = {
        let scrollview = UIScrollView()
        scrollview.backgroundColor = .evyWhite
        scrollview.showsVerticalScrollIndicator = false
        scrollview.showsHorizontalScrollIndicator = false
        scrollview.contentSize = CGSize(width: UIScreen.main.bounds.width * 1.4, height: UIScreen.main.bounds.height * 1.4)
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
    private let finishButton = GotoSomewhereButton()
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
        self.setupLayout()
        self.setupButton()
    }

    // MARK: - func

    private func setupButton() {
        self.finishButton.setupButtonContents(buttonImage: UIImage(systemName: "checkmark.circle") ?? UIImage(),
                                              buttonTitle: StringLiteral.finishSelectButtonText)
    }

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
                                padding: UIEdgeInsets(top: 360.adjustedHeight,
                                                      left: 260.adjustedWidth,
                                                      bottom: 0,
                                                      right: 0))

        self.scrollView.addSubview(self.art)
        self.art.constraint(top: self.society.topAnchor,
                            leading: self.society.trailingAnchor,
                            padding: UIEdgeInsets(top: -100.adjustedHeight,
                                                  left: 20.adjustedWidth,
                                                  bottom: 0,
                                                  right: 0))

        self.scrollView.addSubview(self.animal)
        self.animal.constraint(top: self.society.bottomAnchor,
                               leading: self.society.leadingAnchor,
                               padding: UIEdgeInsets(top: 10.adjustedHeight,
                                                     left: 100.adjustedWidth,
                                                     bottom: 0,
                                                     right: 0))

        self.scrollView.addSubview(self.broadcast)
        self.broadcast.constraint(top: self.animal.bottomAnchor,
                                  leading: self.animal.leadingAnchor,
                                  padding: UIEdgeInsets(top: 10.adjustedHeight,
                                                        left: -20.adjustedWidth,
                                                        bottom: 0,
                                                        right: 0))

        self.scrollView.addSubview(self.health)
        self.health.constraint(top: self.art.topAnchor,
                               leading: self.art.trailingAnchor,
                               padding: UIEdgeInsets(top: -50.adjustedHeight,
                                                     left: 10.adjustedWidth,
                                                     bottom: 0,
                                                     right: 0))

        self.scrollView.addSubview(self.culture)
        self.culture.constraint(top: self.art.bottomAnchor,
                                leading: self.animal.trailingAnchor,
                                padding: UIEdgeInsets(top: 0.adjustedHeight,
                                                      left: 45.adjustedWidth,
                                                      bottom: 0,
                                                      right: 0))

        self.scrollView.addSubview(self.money)
        self.money.constraint(top: self.culture.bottomAnchor,
                              leading: self.broadcast.trailingAnchor,
                              padding: UIEdgeInsets(top: 10.adjustedHeight,
                                                    left: 20.adjustedWidth,
                                                    bottom: 0,
                                                    right: 0))

        self.scrollView.addSubview(self.environment)
        self.environment.constraint(top: self.money.bottomAnchor,
                                    leading: self.money.leadingAnchor,
                                    padding: UIEdgeInsets(top: 10.adjustedHeight,
                                                          left: 10.adjustedWidth,
                                                          bottom: 0,
                                                          right: 0))

        self.scrollView.addSubview(self.health)
        self.health.constraint(top: self.art.topAnchor,
                               leading: self.art.trailingAnchor,
                               padding: UIEdgeInsets(top: -50.adjustedHeight,
                                                     left: 10.adjustedWidth,
                                                     bottom: 0,
                                                     right: 0))

        self.scrollView.addSubview(self.company)
        self.company.constraint(top: self.health.bottomAnchor,
                                leading: self.culture.trailingAnchor,
                                padding: UIEdgeInsets(top: 10.adjustedHeight,
                                                      left: 15.adjustedWidth,
                                                      bottom: 0,
                                                      right: 0))

        self.scrollView.addSubview(self.science)
        self.science.constraint(top: self.company.bottomAnchor,
                                leading: self.money.trailingAnchor,
                                padding: UIEdgeInsets(top: 15.adjustedHeight,
                                                      left: 15.adjustedWidth,
                                                      bottom: 0,
                                                      right: 0))

        self.scrollView.addSubview(self.world)
        self.world.constraint(top: self.science.bottomAnchor,
                              leading: self.environment.trailingAnchor,
                              padding: UIEdgeInsets(top: 10.adjustedHeight,
                                                    left: 20.adjustedWidth,
                                                    bottom: 0,
                                                    right: 0))

        self.scrollView.addSubview(self.exercise)
        self.exercise.constraint(top: self.health.topAnchor,
                                 leading: self.health.trailingAnchor,
                                 padding: UIEdgeInsets(top: 30.adjustedHeight,
                                                       left: 10.adjustedWidth,
                                                       bottom: 0,
                                                       right: 0))

        self.scrollView.addSubview(self.robot)
        self.robot.constraint(top: self.exercise.topAnchor,
                              leading: self.exercise.trailingAnchor,
                              padding: UIEdgeInsets(top: 10.adjustedHeight,
                                                    left: 10.adjustedWidth,
                                                    bottom: 0,
                                                    right: 0))

        self.scrollView.addSubview(self.economy)
        self.economy.constraint(top: self.robot.bottomAnchor,
                                leading: self.company.trailingAnchor,
                                padding: UIEdgeInsets(top: 10.adjustedHeight,
                                                      left: 30.adjustedWidth,
                                                      bottom: 0,
                                                      right: 0))

        self.scrollView.addSubview(self.history)
        self.history.constraint(top: self.economy.bottomAnchor,
                                leading: self.science.trailingAnchor,
                                padding: UIEdgeInsets(top: 40.adjustedHeight,
                                                      left: 20.adjustedWidth,
                                                      bottom: 0,
                                                      right: 0))

        self.scrollView.addSubview(self.economyIT)
        self.economyIT.constraint(top: self.history.bottomAnchor,
                                  leading: self.world.trailingAnchor,
                                  padding: UIEdgeInsets(top: 25.adjustedHeight,
                                                        left: 5.adjustedWidth,
                                                        bottom: 0,
                                                        right: 0))

        self.scrollView.addSubview(self.space)
        self.space.constraint(top: self.history.bottomAnchor,
                              leading: self.economyIT.trailingAnchor,
                              padding: UIEdgeInsets(top: 5.adjustedHeight,
                                                    left: 10.adjustedWidth,
                                                    bottom: 0,
                                                    right: 0))

        self.scrollView.addSubview(self.greetingLabel)
        self.greetingLabel.constraint(top: self.view.topAnchor,
                                      leading: self.view.leadingAnchor,
                                      padding: UIEdgeInsets(top: 60.adjustedHeight, left: 40.adjustedWidth, bottom: 0, right: 0))

        self.scrollView.addSubview(self.selectGuideTitleLabel)
        self.selectGuideTitleLabel.constraint(top: self.greetingLabel.bottomAnchor,
                                              leading: self.greetingLabel.leadingAnchor,
                                              padding: UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0))

        self.view.addSubview(self.finishButton)
        self.finishButton.constraint(bottom: self.view.bottomAnchor,
                                     trailing: self.view.trailingAnchor,
                                     padding: UIEdgeInsets(top: 0,
                                                           left: 0,
                                                           bottom: 46.adjustedHeight,
                                                           right: 40.adjustedWidth))
     }
 }
