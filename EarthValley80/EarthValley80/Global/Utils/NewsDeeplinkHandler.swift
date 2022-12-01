//
//  NewsDeeplinkHandler.swift
//  EarthValley80
//
//  Created by SHIN YOON AH on 2022/12/01.
//

import UIKit

protocol NewsDeeplinkHandlerProtocol {
    func canOpenURL(_ url: URL) -> Bool
    func openURL(_ url: URL, newsId: String)
}

final class NewsDeeplinkHandler: NewsDeeplinkHandlerProtocol {

    private weak var rootViewController: UIViewController?

    // MARK: - init

    init(rootViewController: UIViewController?) {
        self.rootViewController = rootViewController
    }

    // MARK: - func

    func canOpenURL(_ url: URL) -> Bool {
        return url.absoluteString == StringLiteral.deeplink
    }

    func openURL(_ url: URL, newsId: String) {
        guard self.canOpenURL(url) else { return }

        self.presentReadingNewsViewController(newsId: newsId)
    }

    private func presentReadingNewsViewController(newsId: String) {
        let readingNewsViewController = ReadingNewsViewController()
        readingNewsViewController.modalTransitionStyle = .crossDissolve
        readingNewsViewController.modalPresentationStyle = .fullScreen
        self.rootViewController?.present(readingNewsViewController, animated: true)
    }
}
