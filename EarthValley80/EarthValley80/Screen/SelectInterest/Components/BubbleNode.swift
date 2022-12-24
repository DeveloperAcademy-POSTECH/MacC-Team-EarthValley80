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
        let attStr: NSMutableAttributedString = NSMutableAttributedString(string: tag)
        attStr.mutableString.setString(tag)
        attStr.addAttribute(.font, value: UIFont.systemFont(ofSize: 20), range: NSMakeRange(0, attStr.length))
        attStr.addAttribute(.foregroundColor, value: UIColor.white, range: NSMakeRange(0, attStr.length))
        attStr.addAttribute(.strokeColor, value: UIColor.white, range: NSMakeRange(0, attStr.length))
        attStr.addAttribute(.strokeWidth, value: -4.0, range: NSMakeRange(0, attStr.length))
        node.labelNode.attributedText = attStr
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

