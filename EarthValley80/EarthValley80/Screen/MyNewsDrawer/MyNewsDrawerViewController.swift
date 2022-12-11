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
        static let leadingSpacing: CGFloat = 39.0
    }

    // MARK: - property

    private let myNewsDrawerTitle: MainTitleView = {
        let titleView = MainTitleView()
        titleView.changeLabelText(date: Date().dateFormatted("EEEE, MM d"),
                                  title: StringLiteral.myNewsDrawerTitle,
                                  description: StringLiteral.myNewsDrawerTitleDescription)
        return titleView
    }()
    private let backgroundView = UIImageView(image: ImageLiteral.imgPaperBackground)
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = Size.cellInterval
        layout.minimumInteritemSpacing = Size.cellInterval
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: Size.leadingSpacing)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.register(cell: MyNewsDrawerCollectionViewCell.self)
        collectionView.register(cell: EmptySpaceCollectionViewCell.self)
        return collectionView
    }()

    // TODO: - 더미데이터 입니다. 추후 변경 예정입니다. 내림차순으로 정렬해주어야합니다.
    private let sortingManager = NewsSortingManager()
    private lazy var newsData: [News] = self.sortingManager.arrangeNewsData(savedNews)

    // MARK: - init

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupLayout()
    }

    // MARK: - func

    private func setupLayout() {
        self.view.addSubview(self.backgroundView)
        self.backgroundView.constraint(to: self.view)

        self.view.addSubview(self.myNewsDrawerTitle)
        self.myNewsDrawerTitle.constraint(top: self.view.safeAreaLayoutGuide.topAnchor,
                                          leading: self.view.leadingAnchor,
                                          trailing: self.view.trailingAnchor,
                                          padding: UIEdgeInsets(top: 60, left: Size.leadingSpacing, bottom: 0, right: 0))

        self.view.addSubview(self.collectionView)
        self.collectionView.constraint(top: self.myNewsDrawerTitle.bottomAnchor,
                                       leading: self.myNewsDrawerTitle.leadingAnchor,
                                       bottom: self.view.bottomAnchor,
                                       trailing: self.view.trailingAnchor,
                                       padding: UIEdgeInsets(top: 37, left: 0, bottom: 0, right: 0))
    }
}

// MARK: - UICollectionViewDataSource
extension MyNewsDrawerViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.newsData.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let hasTitle = self.newsData[indexPath.row].title != nil

        switch hasTitle {
        case true:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyNewsDrawerCollectionViewCell.className, for: indexPath) as? MyNewsDrawerCollectionViewCell else { return UICollectionViewCell() }
            cell.setData(self.newsData[indexPath.row])
            cell.calculateLabelWidth(self.newsData[indexPath.row])
            return cell
        case false:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EmptySpaceCollectionViewCell.className, for: indexPath) as? EmptySpaceCollectionViewCell else { return UICollectionViewCell() }
            return cell
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension MyNewsDrawerViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var width: CGFloat
        if self.newsData[indexPath.item].title?.count ?? 0 > Size.standardOfTitle {
            width = ((collectionView.frame.width - (Size.cellInterval * 4) - Size.leadingSpacing) / Size.column) * 2 + Size.cellInterval
        } else {
            width = (collectionView.frame.width - (Size.cellInterval * 4) - Size.leadingSpacing) / Size.column - 0.00000001
        }

        return CGSize(width: width, height: Size.cellHeight)
    }
}
