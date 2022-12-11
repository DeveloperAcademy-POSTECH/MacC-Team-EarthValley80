//
//  SIFloatingCollectionScene.swift
//  EarthValley80
//
//  Created by LeeJiSoo on 2022/12/11.
//

import SpriteKit

public enum SIFloatingCollectionSceneMode {
    case normal
    case moving
}

open class SIFloatingCollectionScene: SKScene {

    // MARK: - property

    private(set) var mode: SIFloatingCollectionSceneMode = .normal {
        didSet {
            self.modeUpdated()
        }
    }

    public private(set) var magneticField = SKFieldNode.radialGravityField()
    public private(set) var floatingNodes: [SIFloatingNode] = []
    private var touchPoint: CGPoint?
    private var touchStartedTime: TimeInterval?
    private var removingStartedTime: TimeInterval?
    open var allowMultipleSelection = true
    open var restrictedToBounds = true
    open var pushStrength: CGFloat = 10000
    open weak var floatingDelegate: SIFloatingCollectionSceneDelegate?

    // MARK: - func

    override open func didMove(to view: SKView) {
        super.didMove(to: view)
        self.configure()
    }

    override open func update(_ currentTime: TimeInterval) {
        self.floatingNodes.forEach { node in
            let distanceFromCenter = self.magneticField.position.distance(from: node.position)
            // linearDamping : 선형 속도를 줄이는 속성, 길수록 가운데로 모이는 선형 속도가 느림!!
            node.physicsBody?.linearDamping = 0.01

            if distanceFromCenter <= 100 {
                node.physicsBody?.linearDamping += ((100 - distanceFromCenter) / 10)
            }
        }
    }

    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first as UITouch? {
            self.touchPoint = touch.location(in: self)
            self.touchStartedTime = touch.timestamp
        }
    }

    override open func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first as UITouch? {
            let plin = touch.previousLocation(in: self)
            let lin = touch.location(in: self)
            var dx = lin.x - plin.x
            var dy = lin.y - plin.y
            let b = sqrt(pow(lin.x, 2) + pow(lin.y, 2))
            dx = b == 0 ? 0 : (dx / b)
            dy = b == 0 ? 0 : (dy / b)

            if dx == 0 && dy == 0 {
                return
            }
            else if self.mode != .moving {
                self.mode = .moving
            }

            for node in self.floatingNodes {
                let w = node.frame.size.width / 2
                let h = node.frame.size.height / 2
                var direction = CGVector(
                    dx: self.pushStrength * dx,
                    dy: self.pushStrength * dy
                )

                if self.restrictedToBounds {
                    if !(-w...(size.width + w) ~= node.position.x) && (node.position.x * dx) > 0 {
                        direction.dx = 0
                    }

                    if !(-h...(size.height + h) ~= node.position.y) && (node.position.y * dy) > 0 {
                        direction.dy = 0
                    }
                }
                node.physicsBody?.applyForce(direction)
            }
        }
    }

    override open func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if self.mode != .moving, let touchPoint = self.touchPoint {
            if let node = self.atPoint(touchPoint) as? SIFloatingNode {
                self.updateState(of: node)
            }
        }
        self.mode = .normal
    }

    override open func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.mode = .normal
    }

    open func floatingNode(at index: Int) -> SIFloatingNode? {
        if 0..<self.floatingNodes.count ~= index {
            return self.floatingNodes[index]
        }
        return nil
    }

    open func indexOfSelectedNode() -> Int? {
        return self.indexesOfSelectedNodes().first
    }

    open func indexesOfSelectedNodes() -> [Int] {
        var indexes: [Int] = []

        for (i, node) in self.floatingNodes.enumerated() {
            if node.self.state == .selected {
                indexes.append(i)
            }
        }
        return indexes
    }

    override open func atPoint(_ p: CGPoint) -> SKNode {
        var currentNode = super.atPoint(p)

        while !(currentNode.parent is SKScene) && !(currentNode is SIFloatingNode)
            && (currentNode.parent != nil) && !currentNode.isUserInteractionEnabled {
                currentNode = currentNode.parent!
        }
        return currentNode
    }

    private func updateState(of node: SIFloatingNode) {
        if let index = self.floatingNodes.firstIndex(of: node) {
            switch node.self.state {
            case .normal:
                if self.shouldSelectNode(at: index) {
                    if !allowMultipleSelection, let selectedIndex = self.indexOfSelectedNode() {
                        let node = self.floatingNodes[selectedIndex]
                        self.updateState(of: node)
                    }
                    node.self.state = .selected
                    self.floatingDelegate?.floatingScene?(self, didSelectFloatingNodeAt: index)
                }
            case .selected:
                if self.shouldDeselectNode(at: index) {
                    node.self.state = .normal
                    self.floatingDelegate?.floatingScene?(self, didDeselectFloatingNodeAt: index)
                }
            }
        }
    }

    // MARK: Configuration

    override open func addChild(_ node: SKNode) {
        if let newNode = node as? SIFloatingNode {
            self.configureNode(newNode)
            self.floatingNodes.append(newNode)
        }
        super.self.addChild(node)
    }

    private func configure() {
        self.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        self.magneticField = SKFieldNode.radialGravityField()
        self.magneticField.region = SKRegion(radius: 10000)
        self.magneticField.minimumRadius = 10000
        self.magneticField.strength = 8000
        self.magneticField.position = CGPoint(x: size.width / 2, y: size.height / 2)
        self.addChild(magneticField)
    }

    private func configureNode(_ node: SIFloatingNode!) {
        if node.physicsBody == nil {
            node.physicsBody = SKPhysicsBody(circleOfRadius: max(node.size.width / 2 + 20, node.size.height / 2 + 20))
        }
        node.physicsBody?.isDynamic = true
        node.physicsBody?.affectedByGravity = false
        node.physicsBody?.allowsRotation = false
        node.physicsBody?.mass = 0.3
        node.physicsBody?.friction = 0
        node.physicsBody?.linearDamping = 3
    }

    private func modeUpdated() {
        switch self.mode {
        case .normal, .moving:
            self.touchStartedTime = nil
            self.removingStartedTime = nil
            self.touchPoint = nil
        }
    }

    // MARK: Floating Delegate Helpers

    private func shouldSelectNode(at index: Int) -> Bool {
        if let shouldSelect = self.floatingDelegate?.floatingScene?(self, shouldSelectFloatingNodeAt: index) {
            return shouldSelect
        }
        return true
    }

    private func shouldDeselectNode(at index: Int) -> Bool {
        if let shouldDeselect = self.floatingDelegate?.floatingScene?(self, shouldDeselectFloatingNodeAt: index) {
            return shouldDeselect
        }
        return true
    }
}

// MARK: - SIFloatingCollectionSceneDelegate
@objc public protocol SIFloatingCollectionSceneDelegate {
    @objc optional func floatingScene(_ scene: SIFloatingCollectionScene, shouldSelectFloatingNodeAt index: Int) -> Bool
    @objc optional func floatingScene(_ scene: SIFloatingCollectionScene, didSelectFloatingNodeAt index: Int)

    @objc optional func floatingScene(_ scene: SIFloatingCollectionScene, shouldDeselectFloatingNodeAt index: Int) -> Bool
    @objc optional func floatingScene(_ scene: SIFloatingCollectionScene, didDeselectFloatingNodeAt index: Int)
}
