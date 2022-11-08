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
        let lottieAttainmentStandard = [1, 3, 6, 10, 13, 15, 20, 25, 30, 35, 40, 45, 50]
        let locationOfNil = [0, 4, 8, 13, 17, 24, 29, 34, 39, 44, 49, 54, 59]
        let myNewsDataCount = data.count
        var reversedData = data
        var nilIndex = 0

        for number in lottieAttainmentStandard {
            if myNewsDataCount == 1 {
                reversedData.insert(News(title: nil, category: nil), at: 0)
                break
            } else if myNewsDataCount < number {
                nilIndex = lottieAttainmentStandard.firstIndex(of: number) ?? 0
                nilIndex -= 1
                for i in 0..<nilIndex {
                    reversedData.insert(News(title: nil, category: nil), at: locationOfNil[i])
                    print(reversedData.count)
                }
                break
            }
        }
        return reversedData.reversed()
    }
}
