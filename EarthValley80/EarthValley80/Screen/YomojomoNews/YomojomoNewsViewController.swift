//
//  YomojomoNewsViewController.swift
//  EarthValley80
//
//  Created by SHIN YOON AH on 2022/10/17.
//

import UIKit

class YomojomoNewsViewController: UIViewController {

    // MARK: - property

    private let yomojomoTitleView: MainTitleView = {
        let titleView = MainTitleView()
        titleView.dateLabel.text = Date().dateFormatted("EEEE, MMM d")
        titleView.yomojomoTitleLabel.text = StringLiteral.yomojomoNewsTitle
        titleView.titleDescriptionLabel.text = StringLiteral.yomojomoNewsTitleDescription
        return titleView
    }()
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
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
                                     trailing: self.view.leadingAnchor,
                                     padding: UIEdgeInsets(top: 60, left: 0, bottom: 0, right: 0))
    }
}

// MARK: - UICollectionViewDataSource
extension YomojomoNewsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newsData.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = UICollectionViewCell()
        return cell
    }

}

// MARK: - UICollectionViewDelegateFlowLayout
extension YomojomoNewsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        // MARK: - width 및 column 설정

        var width: CGFloat
        if newsData[indexPath.item].newsTitle.count > 30 {
            width = ((collectionView.frame.width - (12 * 4)) / 5) * 2 + 12
        } else {
            width = (collectionView.frame.width - (12 * 4)) / 5
        }

        return CGSize(width: width, height: 180)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }
}
