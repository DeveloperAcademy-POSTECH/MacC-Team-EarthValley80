//
//  NewsManager.swift
//  EarthValley80
//
//  Created by SHIN YOON AH on 2022/11/23.
//

import Foundation

final class NewsManager {

    static let shared = NewsManager()

    // MARK: - property

    private(set) var newsTitle: String = ""
    private(set) var newsContent: String = ""
    private(set) var mainSentences: [String] = []

    // MARK: - init

    private init() { }

    // MARK: - func

    func resetAll() {
        self.newsTitle = ""
        self.newsContent = ""
        self.mainSentences.removeAll()
    }

    func setupNews(title: String, content: String) {
        self.newsTitle = title
        self.newsContent = content
    }

    func setupMainSentences(_ sentences: [String]) {
        self.mainSentences = sentences
    }
}
