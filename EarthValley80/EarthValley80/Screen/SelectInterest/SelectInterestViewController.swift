//
//  SelectInterestViewController.swift
//  EarthValley80
//
//  Created by LeeJiSoo on 2022/11/23.
//

import SpriteKit
import UIKit

final class SelectInterestViewController: UIViewController {

    // MARK: - property
    
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
    private var skView = SKView()
    private var floatingCollectionScene = BubblesScene()
    private let finishButton = GotoSomewhereButton()

    private var categoryList = [("art", "예술"), ("environment", "환경"), ("money", "돈"), ("animal", "동물"),
                                ("company", "회사"), ("space", "우주"), ("economyIT", "IT"), ("economy", "경제"),
                                ("robot", "로봇"), ("society", "사회"), ("broadcast", "방송"), ("culture", "문화"),
                                ("history", "역사"), ("exercise", "운동"), ("health", "견강"), ("science", "과학"), ("world", "세계")]

    // MARK: - life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupFloatingSKView()
        self.setupLayout()
        self.setupButton()
    }

    // MARK: - func

    private func setupFloatingSKView() {
        self.skView = SKView(frame: UIScreen.main.bounds)
        self.skView.backgroundColor = SKColor.white
        self.view.addSubview(skView)

        self.floatingCollectionScene = BubblesScene(size: skView.bounds.size)
        self.floatingCollectionScene.topOffset = 0
        self.skView.presentScene(self.floatingCollectionScene)

        for indexNum in 0..<categoryList.count {
            addBubble(category: categoryList[indexNum].0, tag: indexNum)
        }
    }

    private func setupButton() {
        self.finishButton.setupButtonContents(buttonImage: ImageLiteral.icoCheck,
                                              buttonTitle: StringLiteral.finishSelectButtonText)
    }

    private func setupLayout() {
        self.view.addSubview(self.greetingLabel)
        self.greetingLabel.constraint(top: self.view.topAnchor,
                                      leading: self.view.leadingAnchor,
                                      padding: UIEdgeInsets(top: 60.adjustedHeight, left: 40.adjustedWidth, bottom: 0, right: 0))

        self.view.addSubview(self.selectGuideTitleLabel)
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

    @objc
    func addBubble(category: String, tag: Int) {
        let image = UIImage(named: category)!
        let texture = SKTexture(image: image)
        let newNode = BubbleNode.instantiate(texture: texture, tag: categoryList[tag].1)

        newNode.selectedNode = {
            newNode.texture = SKTexture(image: UIImage(named: "selected_\(category)")!)
        }
        newNode.deselectedNode = {
            newNode.texture = SKTexture(image: UIImage(named: category)!)
        }
        self.floatingCollectionScene.addChild(newNode)
    }
 }
