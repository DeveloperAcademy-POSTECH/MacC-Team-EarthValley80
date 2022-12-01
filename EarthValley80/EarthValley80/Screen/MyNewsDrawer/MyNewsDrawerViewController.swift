//
//  MyNewsDrawerViewController.swift
//  EarthValley80
//
//  Created by SHIN YOON AH on 2022/10/17.
//

import UIKit

import Lottie

final class MyNewsDrawerViewController: UIViewController {

    private enum Size {
        static let standardOfTitle: Int = 30
        static let cellInterval: CGFloat = 12
        static let column: CGFloat = 5
        static let cellHeight: CGFloat = 180.0
    }

    // MARK: - property

    private let myNewsDrawerTitle: MainTitleView = {
        let titleView = MainTitleView()
        titleView.changeLabelText(date: Date().dateFormatted("EEEE, MM d"),
                                  title: StringLiteral.myNewsDrawerTitle,
                                  description: StringLiteral.myNewsDrawerTitleDescription)
        return titleView
    }()
    private lazy var collectionView: UICollectionView = {
        let layout = LeftAlignCollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = Size.cellInterval
        layout.minimumInteritemSpacing = Size.cellInterval
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(cell: ThisWeekNewsCollectionViewCell.self)
        collectionView.register(cell: UserGoalAttainmentLottieCollectionViewCell.self)
        return collectionView
    }()

    // TODO: - 더미데이터 입니다. 추후 변경 예정입니다. nil데이터를 추가해주고 다시 db에 저장해주어야합니다.
    private let newsModel = NewsSortingManager()
    private lazy var myNewsData: [News] = self.newsModel.appendNilDataForMyNewsDrawer(yomojomoViewDummyData)
    private lazy var totalCountExcludeNil: Int = self.myNewsData.filter{ ($0.title != nil) }.count

    // MARK: - init

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupLayout()
    }

    // MARK: - func

    private func setupLayout() {
        self.view.addSubview(self.myNewsDrawerTitle)
        self.myNewsDrawerTitle.constraint(top: self.view.safeAreaLayoutGuide.topAnchor,
                                     leading: self.view.leadingAnchor,
                                     trailing: self.view.trailingAnchor,
                                     padding: UIEdgeInsets(top: 60, left: 0, bottom: 0, right: 0))

        self.view.addSubview(self.collectionView)
        self.collectionView.constraint(top: self.myNewsDrawerTitle.bottomAnchor,
                                  leading: self.myNewsDrawerTitle.leadingAnchor,
                                  bottom: self.view.bottomAnchor,
                                  trailing: self.view.trailingAnchor,
                                  padding: UIEdgeInsets(top: 37, left: 0, bottom: 0, right: 0))
    }

    private func calculateLabelIndex(indexPath: Int) -> Int {
        let fromZeroToindex = self.myNewsData[0...indexPath]
        return self.totalCountExcludeNil - fromZeroToindex.filter{ $0.title != nil }.count
    }
}

// MARK: - UICollectionViewDataSource
extension MyNewsDrawerViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.myNewsData.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if myNewsData[indexPath.row].title == nil {
            let labelIndex: Int = self.calculateLabelIndex(indexPath: indexPath.row)
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UserGoalAttainmentLottieCollectionViewCell.className, for: indexPath) as? UserGoalAttainmentLottieCollectionViewCell else { return UICollectionViewCell() }
            // TODO: - 테플에서는 로티 4개정도 random, 나중에 수정하겠습니다.
            let lottieNumber = Int.random(in: 0...3)
            cell.setLottieImage(to: "myNewsDrawerLottie\(lottieNumber)")
            cell.setLottieLabel(index: labelIndex)
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ThisWeekNewsCollectionViewCell.className, for: indexPath) as? ThisWeekNewsCollectionViewCell else { return UICollectionViewCell() }
            cell.setData(myNewsData[indexPath.row])
            cell.calculateLabelWidth(myNewsData[indexPath.row])
            return cell
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension MyNewsDrawerViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var width: CGFloat
        if myNewsData[indexPath.item].title?.count ?? 0 > Size.standardOfTitle {
            width = ((collectionView.frame.width - (Size.cellInterval * 4)) / Size.column) * 2 + Size.cellInterval
        } else {
            width = (collectionView.frame.width - (Size.cellInterval * 4)) / Size.column - 0.00000001
        }

        return CGSize(width: width, height: Size.cellHeight)
    }
}
