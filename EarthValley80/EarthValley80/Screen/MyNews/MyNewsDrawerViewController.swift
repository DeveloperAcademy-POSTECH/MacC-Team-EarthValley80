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
        collectionView.register(MyNewsDrawerCollectionViewCell.self, forCellWithReuseIdentifier: MyNewsDrawerCollectionViewCell.className)
        return collectionView
    }()

    private let newsData: [News] = yomojomoViewDummyData

    // MARK: - init

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
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
}

// MARK: - UICollectionViewDataSource
extension MyNewsDrawerViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.newsData.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyNewsDrawerCollectionViewCell.className, for: indexPath) as? MyNewsDrawerCollectionViewCell else { return UICollectionViewCell() }
        cell.setData(newsData[indexPath.row])
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension MyNewsDrawerViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var width: CGFloat
        if newsData[indexPath.item].title.count > Size.standardOfTitle {
            width = ((collectionView.frame.width - (Size.cellInterval * 4)) / Size.column) * 2 + Size.cellInterval
        } else {
            width = (collectionView.frame.width - (Size.cellInterval * 4)) / Size.column
        }

        return CGSize(width: width, height: Size.cellHeight)
    }
}
