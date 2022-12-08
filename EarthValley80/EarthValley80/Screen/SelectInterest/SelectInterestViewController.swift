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
    private let societyShapeView: CategoryShapeView = CategoryShapeView(image: ImageLiteral.society, labelText: "사회")
    private let worldShapeView: CategoryShapeView = CategoryShapeView(image: ImageLiteral.world, labelText: "세계")
    private let historyShapeView: CategoryShapeView = CategoryShapeView(image: ImageLiteral.history, labelText: "역사")
    private let robotShapeView: CategoryShapeView = CategoryShapeView(image: ImageLiteral.robot, labelText: "로봇")
    private let environmentShapeView: CategoryShapeView = CategoryShapeView(image: ImageLiteral.environment, labelText: "환경")
    private let healthShapeView: CategoryShapeView = CategoryShapeView(image: ImageLiteral.health, labelText: "건강")
    private let animalShapeView: CategoryShapeView = CategoryShapeView(image: ImageLiteral.animal, labelText: "동물")
    private let spaceShapeView: CategoryShapeView = CategoryShapeView(image: ImageLiteral.space, labelText: "우주")
    private let scienceShapeView: CategoryShapeView = CategoryShapeView(image: ImageLiteral.science, labelText: "과학")
    private let companyShapeView: CategoryShapeView = CategoryShapeView(image: ImageLiteral.company, labelText: "회사")
    private let moneyShapeView: CategoryShapeView = CategoryShapeView(image: ImageLiteral.money, labelText: "돈")
    private let economyITShapeView: CategoryShapeView = CategoryShapeView(image: ImageLiteral.economyIT, labelText: "IT")
    private let economyShapeView: CategoryShapeView = CategoryShapeView(image: ImageLiteral.economy, labelText: "경제")
    private let artShapeView: CategoryShapeView = CategoryShapeView(image: ImageLiteral.art, labelText: "예술")
    private let broadcastShapeView: CategoryShapeView = CategoryShapeView(image: ImageLiteral.broadcast, labelText: "방송")
    private let exerciseShapeView: CategoryShapeView = CategoryShapeView(image: ImageLiteral.exercise, labelText: "운동")
    private let cultureShapeView: CategoryShapeView = CategoryShapeView(image: ImageLiteral.culture, labelText: "문화")

    // MARK: - life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupLayout()
        self.setupButton()
    }

    // MARK: - func

    private func setupButton() {
        self.finishButton.setupButtonContents(buttonImage: ImageLiteral.icoCheck,
                                              buttonTitle: StringLiteral.finishSelectButtonText)
    }

    private func setupLayout() {
        self.view.addSubview(self.scrollView)
        self.scrollView.constraint(top: self.view.topAnchor,
                                   leading: self.view.leadingAnchor,
                                   bottom: self.view.bottomAnchor,
                                   trailing: self.view.trailingAnchor,
                                   padding: UIEdgeInsets.zero)

        self.scrollView.addSubview(self.societyShapeView)
        self.societyShapeView.constraint(top: self.scrollView.topAnchor,
                                leading: self.scrollView.leadingAnchor,
                                padding: UIEdgeInsets(top: 360.adjustedHeight,
                                                      left: 260.adjustedWidth,
                                                      bottom: 0,
                                                      right: 0))

        self.scrollView.addSubview(self.artShapeView)
        self.artShapeView.constraint(top: self.societyShapeView.topAnchor,
                            leading: self.societyShapeView.trailingAnchor,
                            padding: UIEdgeInsets(top: -100.adjustedHeight,
                                                  left: 20.adjustedWidth,
                                                  bottom: 0,
                                                  right: 0))

        self.scrollView.addSubview(self.animalShapeView)
        self.animalShapeView.constraint(top: self.societyShapeView.bottomAnchor,
                               leading: self.societyShapeView.leadingAnchor,
                               padding: UIEdgeInsets(top: 10.adjustedHeight,
                                                     left: 100.adjustedWidth,
                                                     bottom: 0,
                                                     right: 0))

        self.scrollView.addSubview(self.broadcastShapeView)
        self.broadcastShapeView.constraint(top: self.animalShapeView.bottomAnchor,
                                  leading: self.animalShapeView.leadingAnchor,
                                  padding: UIEdgeInsets(top: 10.adjustedHeight,
                                                        left: -20.adjustedWidth,
                                                        bottom: 0,
                                                        right: 0))

        self.scrollView.addSubview(self.healthShapeView)
        self.healthShapeView.constraint(top: self.artShapeView.topAnchor,
                               leading: self.artShapeView.trailingAnchor,
                               padding: UIEdgeInsets(top: -50.adjustedHeight,
                                                     left: 10.adjustedWidth,
                                                     bottom: 0,
                                                     right: 0))

        self.scrollView.addSubview(self.cultureShapeView)
        self.cultureShapeView.constraint(top: self.artShapeView.bottomAnchor,
                                leading: self.animalShapeView.trailingAnchor,
                                padding: UIEdgeInsets(top: 0.adjustedHeight,
                                                      left: 45.adjustedWidth,
                                                      bottom: 0,
                                                      right: 0))

        self.scrollView.addSubview(self.moneyShapeView)
        self.moneyShapeView.constraint(top: self.cultureShapeView.bottomAnchor,
                              leading: self.broadcastShapeView.trailingAnchor,
                              padding: UIEdgeInsets(top: 10.adjustedHeight,
                                                    left: 20.adjustedWidth,
                                                    bottom: 0,
                                                    right: 0))

        self.scrollView.addSubview(self.environmentShapeView)
        self.environmentShapeView.constraint(top: self.moneyShapeView.bottomAnchor,
                                    leading: self.moneyShapeView.leadingAnchor,
                                    padding: UIEdgeInsets(top: 10.adjustedHeight,
                                                          left: 10.adjustedWidth,
                                                          bottom: 0,
                                                          right: 0))

        self.scrollView.addSubview(self.healthShapeView)
        self.healthShapeView.constraint(top: self.artShapeView.topAnchor,
                               leading: self.artShapeView.trailingAnchor,
                               padding: UIEdgeInsets(top: -50.adjustedHeight,
                                                     left: 10.adjustedWidth,
                                                     bottom: 0,
                                                     right: 0))

        self.scrollView.addSubview(self.companyShapeView)
        self.companyShapeView.constraint(top: self.healthShapeView.bottomAnchor,
                                leading: self.cultureShapeView.trailingAnchor,
                                padding: UIEdgeInsets(top: 10.adjustedHeight,
                                                      left: 15.adjustedWidth,
                                                      bottom: 0,
                                                      right: 0))

        self.scrollView.addSubview(self.scienceShapeView)
        self.scienceShapeView.constraint(top: self.companyShapeView.bottomAnchor,
                                leading: self.moneyShapeView.trailingAnchor,
                                padding: UIEdgeInsets(top: 15.adjustedHeight,
                                                      left: 15.adjustedWidth,
                                                      bottom: 0,
                                                      right: 0))

        self.scrollView.addSubview(self.worldShapeView)
        self.worldShapeView.constraint(top: self.scienceShapeView.bottomAnchor,
                              leading: self.environmentShapeView.trailingAnchor,
                              padding: UIEdgeInsets(top: 10.adjustedHeight,
                                                    left: 20.adjustedWidth,
                                                    bottom: 0,
                                                    right: 0))

        self.scrollView.addSubview(self.exerciseShapeView)
        self.exerciseShapeView.constraint(top: self.healthShapeView.topAnchor,
                                 leading: self.healthShapeView.trailingAnchor,
                                 padding: UIEdgeInsets(top: 30.adjustedHeight,
                                                       left: 10.adjustedWidth,
                                                       bottom: 0,
                                                       right: 0))

        self.scrollView.addSubview(self.robotShapeView)
        self.robotShapeView.constraint(top: self.exerciseShapeView.topAnchor,
                              leading: self.exerciseShapeView.trailingAnchor,
                              padding: UIEdgeInsets(top: 10.adjustedHeight,
                                                    left: 10.adjustedWidth,
                                                    bottom: 0,
                                                    right: 0))

        self.scrollView.addSubview(self.economyShapeView)
        self.economyShapeView.constraint(top: self.robotShapeView.bottomAnchor,
                                leading: self.companyShapeView.trailingAnchor,
                                padding: UIEdgeInsets(top: 10.adjustedHeight,
                                                      left: 30.adjustedWidth,
                                                      bottom: 0,
                                                      right: 0))

        self.scrollView.addSubview(self.historyShapeView)
        self.historyShapeView.constraint(top: self.economyShapeView.bottomAnchor,
                                leading: self.scienceShapeView.trailingAnchor,
                                padding: UIEdgeInsets(top: 40.adjustedHeight,
                                                      left: 20.adjustedWidth,
                                                      bottom: 0,
                                                      right: 0))

        self.scrollView.addSubview(self.economyITShapeView)
        self.economyITShapeView.constraint(top: self.historyShapeView.bottomAnchor,
                                  leading: self.worldShapeView.trailingAnchor,
                                  padding: UIEdgeInsets(top: 25.adjustedHeight,
                                                        left: 5.adjustedWidth,
                                                        bottom: 0,
                                                        right: 0))

        self.scrollView.addSubview(self.spaceShapeView)
        self.spaceShapeView.constraint(top: self.historyShapeView.bottomAnchor,
                              leading: self.economyITShapeView.trailingAnchor,
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
