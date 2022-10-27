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
    private lazy var newsData: [News] = sortdata(yomojomoViewDummyData)

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

    private func sortdata(_ data: [News]) -> [News] {
        let short = data.filter { $0.newsTitle.count < 30 }.map { $0 }
        let long = data.filter { $0.newsTitle.count >= 40 }.map { $0 }
        var newdata = [News]()
        if long.count / 2 <= short.count {
            newdata = calculateMoreShort(short, long)
        } else {
            newdata = calculateMoreLong(short, long)
        }

        return newdata
    }

    // MARK: calc

    private func calculateMoreLong( _ short: [News], _ long: [News]) -> [News] {
        var newdata = [News]()
        var long = long
        var short = short
        let longcount = long.count
        var needShortCount = 0

        if long.count % 2 == 0 {
            needShortCount = longcount/2  - (short.count+1)
        } else {
            needShortCount = longcount/2  - (short.count)
        }

        for _ in 0..<needShortCount {
            short.insert(News(newsTitle: "-", newsCategory: "-"), at: 0)
        }

        for i in 0..<longcount/2 {
            if i % 3 == 0 {
                newdata.append(long.removeLast())
                newdata.append(long.removeLast())
                if i == (longcount/2-1) {
                    continue
                } else {
                    newdata.append(short.removeLast())
                }
            } else if i % 3 == 1 {
                if i == (longcount/2-1) {
                    continue
                } else {
                    newdata.append(short.removeLast())
                }
                newdata.append(long.removeLast())
                newdata.append(long.removeLast())
            } else {
                newdata.append(long.removeLast())
                if i == (longcount/2-1) {
                    continue
                } else {
                    newdata.append(short.removeLast())
                }
                newdata.append(long.removeLast())
            }
        }

        if !long.isEmpty {
            newdata.append(long.removeLast())
        }

        if !short.isEmpty {
            for _ in 0..<short.count {
                newdata.append(short.removeLast())
            }
        }

        return newdata
    }

    private func calculateMoreShort(_ short: [News], _ long: [News]) -> [News] {
        var newdata = [News]()
        var long = long
        var short = short
        let longcount = long.count

        for i in 0..<longcount/2 {
            if i % 3 == 0 {
                newdata.append(long.removeLast())
                newdata.append(long.removeLast())
                newdata.append(short.removeLast())
            } else if i % 3 == 1 {
                newdata.append(short.removeLast())
                newdata.append(long.removeLast())
                newdata.append(long.removeLast())
            } else {
                newdata.append(long.removeLast())
                newdata.append(short.removeLast())
                newdata.append(long.removeLast())
            }
        }

        if !long.isEmpty {
            newdata.append(long.removeLast())
        }

        if !short.isEmpty {
            for _ in 0..<short.count {
                newdata.append(short.removeLast())
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
        if newsData[indexPath.row].newsTitle == "-" {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EmptySpaceCollectionViewCell.className, for: indexPath) as? EmptySpaceCollectionViewCell else { return UICollectionViewCell() }
            cell.setupLayout()
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: YomojomoNewsTitleCollectionViewCell.className, for: indexPath) as? YomojomoNewsTitleCollectionViewCell else { return UICollectionViewCell() }
            cell.setupLayout()
            cell.setData(newsTitle: newsData[indexPath.row].newsTitle, newsCategory: newsData[indexPath.row].newsCategory)
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
