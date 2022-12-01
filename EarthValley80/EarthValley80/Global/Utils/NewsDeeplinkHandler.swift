//
//  NewsDeeplinkHandler.swift
//  EarthValley80
//
//  Created by SHIN YOON AH on 2022/12/01.
//

import UIKit

@objc
protocol DeeplinkHandlerProtocol {
    func canOpenURL(_ url: URL) -> Bool
    @objc optional func openURL(_ url: URL)
    @objc optional func openURL(_ url: URL, newsId: String)
}

final class NewsDeeplinkHandler: DeeplinkHandlerProtocol {

    private weak var rootViewController: UIViewController?

    private let newsManager = NewsManager.shared

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

        // TODO: - 더미 기사 추가
        let dummyData = yomojomoViewDummyData
        self.newsManager.setupNews(title: dummyData.first?.title ?? "",
                                   content: dummyData.first?.content ?? "",
                                   image: dummyData.first?.image ?? UIImage())

        self.presentReadingNewsViewController(newsId: newsId)
    }

    private func presentReadingNewsViewController(newsId: String) {
        let readingNewsViewController = ReadingNewsViewController()
        readingNewsViewController.modalTransitionStyle = .crossDissolve
        readingNewsViewController.modalPresentationStyle = .fullScreen
        self.rootViewController?.present(readingNewsViewController, animated: true)
    }
}
