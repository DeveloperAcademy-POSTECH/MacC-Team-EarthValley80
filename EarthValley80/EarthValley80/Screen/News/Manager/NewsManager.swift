//
//  NewsManager.swift
//  EarthValley80
//
//  Created by SHIN YOON AH on 2022/11/23.
//

import UIKit

final class NewsManager {

    static let shared = NewsManager()

    // MARK: - property

    private(set) var newsTitle: String = ""
    private(set) var newsContent: String = ""
    private(set) var newsImage: UIImage = UIImage()
    private(set) var newsCategory: String = ""
    private(set) var mainSentences: [String] = []

    // MARK: - init

    private init() { }

    // MARK: - func

    func resetAll() {
        self.newsTitle = ""
        self.newsContent = ""
        self.newsImage = UIImage()
        self.mainSentences.removeAll()
    }

    func setupNews(title: String, content: String, category: String, image: UIImage) {
        self.newsTitle = title
        self.newsContent = content
        self.newsCategory = category
        self.newsImage = image
    }

    func setupMainSentences(_ sentences: [String]) {
        self.mainSentences = sentences
    }
}
