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
        scrollview.showsVerticalScrollIndicator = true
        scrollview.showsHorizontalScrollIndicator = true
        scrollview.contentSize = CGSize(width: UIScreen.main.bounds.width * 1.3, height: UIScreen.main.bounds.height * 1.3)
        return scrollview
    }()
    private let contentView = UIImageView()
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
    }
}
