//
//  DeeplinkCoordinator.swift
//  EarthValley80
//
//  Created by SHIN YOON AH on 2022/12/01.
//

import Foundation

protocol DeeplinkCoordinatorProtocol {
    @discardableResult
    func handleURL(_ url: URL, newsId: String?) -> Bool
}

final class DeeplinkCoordinator {
    
    let handlers: [DeeplinkHandlerProtocol]

    // MARK: - init

    init(handlers: [DeeplinkHandlerProtocol]) {
        self.handlers = handlers
    }
}

// MARK: - DeeplinkCoordinatorProtocol
extension DeeplinkCoordinator: DeeplinkCoordinatorProtocol {

    @discardableResult
    func handleURL(_ url: URL, newsId: String? = nil) -> Bool {
        guard let handler = self.handlers.first(where: { $0.canOpenURL(url) }) else {
            return false
        }

        if let newsId = newsId {
            handler.openURL?(url, newsId: newsId)
        } else {
            handler.openURL?(url)
        }

        return true
    }
}
