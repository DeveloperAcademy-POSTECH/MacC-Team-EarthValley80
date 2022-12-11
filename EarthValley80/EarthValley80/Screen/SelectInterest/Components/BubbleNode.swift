//
//  BubbleNode.swift
//  EarthValley80
//
//  Created by LeeJiSoo on 2022/12/12.
//

import SpriteKit
import UIKit

final class BubbleNode: SIFloatingNode {

    // MARK: - property

    var selectedNode: (() -> ())?
    var deselectedNode: (() -> ())?

    var labelNode = SKLabelNode()

    // MARK: - func

    class func instantiate(texture: SKTexture, tag: String) -> BubbleNode {
        let node = BubbleNode(texture: texture)

        node.self.labelNode.text = tag
        node.self.labelNode.position = CGPoint.zero
        node.self.labelNode.fontColor = SKColor.evyBlack2
        node.self.labelNode.fontSize = 20

        node.self.labelNode.verticalAlignmentMode = .center
        node.self.labelNode.horizontalAlignmentMode = .center
        node.addChild(node.self.labelNode)
        return node
    }

    override func selectingAnimation() -> SKAction? {
        self.selectedNode?()
        return SKAction.scale(to: 1.4, duration: 0.2)
    }

    override func normalizeAnimation() -> SKAction? {
        self.deselectedNode?()
        return SKAction.scale(to: 1, duration: 0.2)
    }
}

