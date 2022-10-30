//
//  YomojomoNewsViewController.swift
//  EarthValley80
//
//  Created by SHIN YOON AH on 2022/10/17.
//

import UIKit

final class YomojomoNewsViewController: UIViewController {

    private enum Size {
        static let standardOfTitle: Int = 30
        static let cellInterval: CGFloat = 12
        static let column: CGFloat = 5
        static let cellHeight: CGFloat = 180.0
    }

    // MARK: - property
    private let yomojomoTitleView: MainTitleView = {
        let titleView = MainTitleView()
        titleView.changeLabelText(date: Date().dateFormatted("EEEE, MM d"),
                                  title: StringLiteral.yomojomoNewsTitle,
                                  description: StringLiteral.yomojomoNewsTitleDescription)
        return titleView
    }()
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = Size.cellInterval
        layout.minimumInteritemSpacing = Size.cellInterval
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(YomojomoNewsTitleCollectionViewCell.self, forCellWithReuseIdentifier: YomojomoNewsTitleCollectionViewCell.className)
        collectionView.register(EmptySpaceCollectionViewCell.self, forCellWithReuseIdentifier: EmptySpaceCollectionViewCell.className)
        return collectionView
    }()
    private lazy var newsData: [News] = self.arrangeNewsData(yomojomoViewDummyData)

    // MARK: - life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupLayout()
    }

    // MARK: - func

    private func setupLayout() {
        self.view.addSubview(self.yomojomoTitleView)
        self.yomojomoTitleView.constraint(top: self.view.safeAreaLayoutGuide.topAnchor,
                                     leading: self.view.leadingAnchor,
                                     trailing: self.view.trailingAnchor,
                                     padding: UIEdgeInsets(top: 60, left: 0, bottom: 0, right: 0))

        self.view.addSubview(self.collectionView)
        self.collectionView.constraint(top: self.yomojomoTitleView.bottomAnchor,
                                  leading: self.yomojomoTitleView.leadingAnchor,
                                  bottom: self.view.bottomAnchor,
                                  trailing: self.view.trailingAnchor,
                                  padding: UIEdgeInsets(top: 37, left: 0, bottom: 0, right: 0))
    }

    private func arrangeNewsData(_ data: [News]) -> [News] {
        let shortNews = data.filter { $0.title.count < Size.standardOfTitle }.map { $0 }
        let longNews = data.filter { $0.title.count >= Size.standardOfTitle }.map { $0 }
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
            shortNews.insert(News(title: "-", category: "-"), at: 0)
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
}

// MARK: - UICollectionViewDataSource
extension YomojomoNewsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.newsData.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if newsData[indexPath.row].title == "-" {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EmptySpaceCollectionViewCell.className, for: indexPath) as? EmptySpaceCollectionViewCell else { return UICollectionViewCell() }
            cell.setupLayout()
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: YomojomoNewsTitleCollectionViewCell.className, for: indexPath) as? YomojomoNewsTitleCollectionViewCell else { return UICollectionViewCell() }
            cell.setData(newsData[indexPath.row])
            return cell
        }
    }

}

// MARK: - UICollectionViewDelegateFlowLayout
extension YomojomoNewsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        // MARK: - width 및 column 설정

        var width: CGFloat
        if newsData[indexPath.item].title.count > Size.standardOfTitle {
            width = ((collectionView.frame.width - (Size.cellInterval * 4)) / Size.column) * 2 + Size.cellInterval
        } else {
            width = (collectionView.frame.width - (Size.cellInterval * 4)) / Size.column
        }

        return CGSize(width: width, height: Size.cellHeight)
    }
}
