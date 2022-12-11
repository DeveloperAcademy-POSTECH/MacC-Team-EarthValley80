//
//  SIFloatingNode.swift
//  EarthValley80
//
//  Created by LeeJiSoo on 2022/12/11.
//

import SpriteKit

public enum SIFloatingNodeState {
    case normal
    case selected
}

open class SIFloatingNode: SKSpriteNode {

    // MARK: - property

    private(set) var previousState: SIFloatingNodeState = .normal
    public var state: SIFloatingNodeState = .normal {
        didSet {
            if self.state != oldValue {
                self.previousState = oldValue
                self.stateChanged()
            }
        }
    }

    private static let selectingKey = "action.selecting"
    private static let normalizeKey = "action.normalize"

    // MARK: - func

    private func stateChanged() {
        var action: SKAction?
        var actionKey: String?

        switch self.state {
        case .normal:
            action = self.normalizeAnimation()
            actionKey = SIFloatingNode.normalizeKey
        case .selected:
            action = self.selectingAnimation()
            actionKey = SIFloatingNode.selectingKey
        }

        if let action = action, let actionKey = actionKey {
            run(action, withKey: actionKey)
        }
    }

    open func selectingAnimation() -> SKAction? { return nil }
    open func normalizeAnimation() -> SKAction? { return nil }
}
