//
//  BubbleScene.swift
//  EarthValley80
//
//  Created by LeeJiSoo on 2022/12/12.
//

import SpriteKit

extension CGFloat {

    public static func random() -> CGFloat {
        return (CGFloat(arc4random()) / CGFloat(UInt32.max))
    }

    public static func random(min: CGFloat, max: CGFloat) -> CGFloat {
        return CGFloat.random() * (max - min) + min
    }
}

final class BubblesScene: SIFloatingCollectionScene {
    var topOffset: CGFloat = 0

    override func didMove(to view: SKView) {
        super.didMove(to: view)
        self.configure()
    }

    private func configure() {
        self.backgroundColor = SKColor.white
        self.scaleMode = .aspectFill
        self.allowMultipleSelection = true

        var bodyFrame = frame
        bodyFrame.size.width = CGFloat(self.magneticField.minimumRadius)
        bodyFrame.origin.x -= bodyFrame.size.width / 2
        bodyFrame.size.height = frame.size.height
        bodyFrame.origin.y = frame.size.height - bodyFrame.size.height
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: bodyFrame)
        self.magneticField.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2 / 2)
    }

    override func addChild(_ node: SKNode) {
        if node is BubbleNode {
            var x = CGFloat.random(min: 0, max: -node.frame.size.width)
            let y = CGFloat.random(
                min: self.frame.size.height - node.frame.size.height,
                max: self.frame.size.height - node.frame.size.height
            )

            if self.floatingNodes.count % 2 == 0 || self.floatingNodes.isEmpty {
                x = CGFloat.random(
                    min: self.frame.size.width + node.frame.size.width,
                    max: self.frame.size.width
                )
            }
            node.position = CGPoint(x: x, y: y)
        }
        super.addChild(node)
    }

    func sortedFloatingNodes() -> [SIFloatingNode] {
        return floatingNodes.sorted { (node: SIFloatingNode, nextNode: SIFloatingNode) -> Bool in
            let distance = node.position.distance(from: self.magneticField.position)
            let nextDistance = nextNode.position.distance(from: self.magneticField.position)
            return distance < nextDistance && node.state != .selected
        }
    }
}
