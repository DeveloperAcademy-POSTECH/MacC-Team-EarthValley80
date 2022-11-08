//
//  NewsSortingManager.swift
//  EarthValley80
//
//  Created by LeeJiSoo on 2022/10/31.
//

import Foundation

struct NewsSortingManager {

    private enum Size {
        static let standardOfTitle: Int = 30
    }

    // MARK: - Yomojomo News

    func arrangeNewsData(_ data: [News]) -> [News] {
        let shortNews = data.filter { $0.title?.count ?? 0 < Size.standardOfTitle }.map { $0 }
        let longNews = data.filter { $0.title?.count ?? 0 >= Size.standardOfTitle }.map { $0 }
        var newdata: [News] = []
        if longNews.count / 2 <= shortNews.count {
            newdata = self.calculateMoreShortNews(shortNews, longNews)
        } else {
            newdata = self.calculateMoreLongNews(shortNews, longNews)
        }
        return newdata
    }

    private func calculateMoreLongNews( _ shortNews: [News], _ longNews: [News]) -> [News] {
        var newdata: [News] = []
        var longNews = longNews
        var shortNews = shortNews
        let longcount = longNews.count
        var needShortCount = 0

        if longNews.count % 2 == 0 {
            needShortCount = longcount/2  - (shortNews.count+1)
        } else {
            needShortCount = longcount/2  - (shortNews.count)
        }

        for _ in 0..<needShortCount {
            shortNews.insert(News(title: nil, category: nil), at: 0)
        }

        for rowNum in 0..<longcount/2 {
            if rowNum % 3 == 0 {
                newdata.append(longNews.removeLast())
                newdata.append(longNews.removeLast())
                if rowNum == (longcount/2-1) {
                    continue
                } else {
                    newdata.append(shortNews.removeLast())
                }
            } else if rowNum % 3 == 1 {
                if rowNum == (longcount/2-1) {
                    continue
                } else {
                    newdata.append(shortNews.removeLast())
                }
                newdata.append(longNews.removeLast())
                newdata.append(longNews.removeLast())
            } else {
                newdata.append(longNews.removeLast())
                if rowNum == (longcount/2-1) {
                    continue
                } else {
                    newdata.append(shortNews.removeLast())
                }
                newdata.append(longNews.removeLast())
            }
        }

        if !longNews.isEmpty {
            newdata.append(longNews.removeLast())
        }

        if !shortNews.isEmpty {
            for _ in 0..<shortNews.count {
                newdata.append(shortNews.removeLast())
            }
        }

        return newdata
    }

    private func calculateMoreShortNews(_ shortNews: [News], _ longNews: [News]) -> [News] {
        var newdata: [News] = []
        var longNews = longNews
        var shortNews = shortNews
        let longcount = longNews.count

        for rowNum in 0..<longcount/2 {
            if rowNum % 3 == 0 {
                newdata.append(longNews.removeLast())
                newdata.append(longNews.removeLast())
                newdata.append(shortNews.removeLast())
            } else if rowNum % 3 == 1 {
                newdata.append(shortNews.removeLast())
                newdata.append(longNews.removeLast())
                newdata.append(longNews.removeLast())
            } else {
                newdata.append(longNews.removeLast())
                newdata.append(shortNews.removeLast())
                newdata.append(longNews.removeLast())
            }
        }

        if !longNews.isEmpty {
            newdata.append(longNews.removeLast())
        }

        if !shortNews.isEmpty {
            for _ in 0..<shortNews.count {
                newdata.append(shortNews.removeLast())
            }
        }

        return newdata
    }

    // MARK: - My News Drawer

    func appendNilDataForMyNewsDrawer(_ data: [News]) -> [News] {
        let lottieCount = data.count / 3 + 1
        var lottieLocation = 0
        var reversedData = data
        reversedData.reverse()

        for count in 0..<lottieCount {
            if count == 0  {
                reversedData.insert(News(title: nil, category: nil), at: count)
            } else {
                reversedData.insert(News(title: nil, category: nil), at: lottieLocation)
            }
            lottieLocation += 4
        }
        return reversedData
    }
}
