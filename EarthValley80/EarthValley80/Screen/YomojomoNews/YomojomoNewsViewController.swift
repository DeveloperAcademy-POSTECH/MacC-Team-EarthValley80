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
        titleView.dateLabel.text = Date().dateFormatted("EEEE, MMM d")
        titleView.dateLabel.setLineSpacing(kernValue: 0.39)
        titleView.yomojomoTitleLabel.text = StringLiteral.yomojomoNewsTitle
        titleView.yomojomoTitleLabel.setLineSpacing(kernValue: -2.4, lineSpacing: 40.0)
        titleView.titleDescriptionLabel.text = StringLiteral.yomojomoNewsTitleDescription
        titleView.titleDescriptionLabel.setLineSpacing(kernValue: -0.64, lineSpacing: 16.0)
        return titleView
    }()
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(YomojomoNewsTitleCollectionViewCell.self, forCellWithReuseIdentifier: YomojomoNewsTitleCollectionViewCell.className)
        return collectionView
    }()
    private var newsData: [News] = yomojomoViewDummyData

    // MARK: - life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupLayout()
    }

    // MARK: - func

    private func setupLayout() {
        self.view.addSubview(yomojomoTitleView)
        yomojomoTitleView.constraint(top: self.view.safeAreaLayoutGuide.topAnchor,
                                     leading: self.view.leadingAnchor,
                                     trailing: self.view.trailingAnchor,
                                     padding: UIEdgeInsets(top: 60, left: 0, bottom: 0, right: 0))

        self.view.addSubview(collectionView)
        collectionView.constraint(top: self.yomojomoTitleView.bottomAnchor,
                                  leading: self.yomojomoTitleView.leadingAnchor,
                                  bottom: self.view.bottomAnchor,
                                  trailing: self.view.trailingAnchor,
                                  padding: UIEdgeInsets(top: 37, left: 0, bottom: 0, right: 0))
    }
}

// MARK: - UICollectionViewDataSource
extension YomojomoNewsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newsData.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: YomojomoNewsTitleCollectionViewCell.className, for: indexPath) as? YomojomoNewsTitleCollectionViewCell else { return UICollectionViewCell() }
        cell.setupLayout()
        cell.setData(newsTitle: newsData[indexPath.row].newsTitle, newsCategory: newsData[indexPath.row].newsCategory)
        return cell
    }

}

// MARK: - UICollectionViewDelegateFlowLayout
extension YomojomoNewsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        // MARK: - width 및 column 설정

        var width: CGFloat
        if newsData[indexPath.item].newsTitle.count > Size.standardOfTitle {
            width = ((collectionView.frame.width - (Size.cellInterval * 4)) / Size.column) * 2 + Size.cellInterval
        } else {
            width = (collectionView.frame.width - (Size.cellInterval * 4)) / Size.column
        }

        return CGSize(width: width, height: Size.cellHeight)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return Size.cellInterval
    }
}
