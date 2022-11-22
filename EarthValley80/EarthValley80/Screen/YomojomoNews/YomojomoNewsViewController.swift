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
        static let slideGuideFontSize: CGFloat = 12.0
        static let contentviewHeight = UIScreen.main.bounds.size.height - 70
        static let yomojomoNewsCollectionviewAndTitleInterval = UIScreen.main.bounds.height / 9
        static let yomojomoCollectionviewHeight = UIScreen.main.bounds.height - 400.0
        static let yomojomoCollectionviewWidth: CGFloat = 300.0
    }

    // MARK: - property

    private let scrollView: UIScrollView = {
        let scrollview = UIScrollView()
        scrollview.translatesAutoresizingMaskIntoConstraints = false
        scrollview.showsVerticalScrollIndicator = false
        return scrollview
    }()
    private let yomojomoNewsContentView = UIView()
    private let yomojomoTitleView: MainTitleView = {
        let titleView = MainTitleView()
        titleView.changeLabelText(date: Date().dateFormatted("EEEE, MM d"),
                                  title: StringLiteral.yomojomoNewsTitle,
                                  description: StringLiteral.yomojomoNewsTitleDescription)
        return titleView
    }()
    private lazy var yomojomoNewsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 113
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(cell: YomojomoNewsCollectionViewCell.self)
        return collectionView
    }()
    private let thisWeekNewsContentView: UIView = {
        let contentview = UIView()
        contentview.backgroundColor = .evyGray2
        return contentview
    }()
    private let thisWeekTitleView: MainTitleView = {
        let titleView = MainTitleView()
        titleView.changeLabelText(date: Date().dateFormatted("EEEE, MM d"),
                                  title: StringLiteral.thisWeekNewsTitle,
                                  description: StringLiteral.thisWeekNewsTitleDescription)
        return titleView
    }()
    private lazy var thisWeekNewsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = Size.cellInterval
        layout.minimumInteritemSpacing = Size.cellInterval
        collectionView.showsVerticalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(cell: ThisWeekNewsCollectionViewCell.self)
        collectionView.register(cell: EmptySpaceCollectionViewCell.self)
        return collectionView
    }()
    private let slideGuideLabel: UILabel = {
        let label = UILabel()
        label.text = StringLiteral.slideGuideText
        label.font = .font(.regular, ofSize: Size.slideGuideFontSize)
        label.textColor = .evyGray1
        label.textAlignment = .center
        return label
    }()

    private let newsModel = NewsSortingManager()
    private lazy var newsData = self.newsModel.arrangeNewsData(yomojomoViewDummyData)

    // MARK: - life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupLayout()
    }

    // MARK: - func

    private func setupLayout() {
        self.view.addSubview(scrollView)
        self.scrollView.constraint(top: self.view.safeAreaLayoutGuide.topAnchor,
                                   leading: self.view.safeAreaLayoutGuide.leadingAnchor,
                                   bottom: self.view.safeAreaLayoutGuide.bottomAnchor,
                                   trailing: self.view.safeAreaLayoutGuide.trailingAnchor,
                                   padding: UIEdgeInsets.zero)

        self.scrollView.addSubview(yomojomoNewsContentView)
        self.yomojomoNewsContentView.constraint(top: self.scrollView.contentLayoutGuide.topAnchor,
                                                leading: self.scrollView.contentLayoutGuide.leadingAnchor,
                                                trailing: self.scrollView.contentLayoutGuide.trailingAnchor,
                                                padding: UIEdgeInsets.zero)
        self.yomojomoNewsContentView.constraint(.widthAnchor, constant: scrollView.frame.width)
        self.yomojomoNewsContentView.constraint(.heightAnchor, constant: Size.contentviewHeight)

        self.yomojomoNewsContentView.addSubview(self.yomojomoTitleView)
        self.yomojomoTitleView.constraint(top: self.yomojomoNewsContentView.topAnchor,
                                          leading: self.yomojomoNewsContentView.leadingAnchor,
                                          trailing: self.yomojomoNewsContentView.trailingAnchor,
                                          padding: UIEdgeInsets(top: 65, left: 0, bottom: 0, right: 0))

        self.yomojomoNewsContentView.addSubview(self.yomojomoNewsCollectionView)
        self.yomojomoNewsCollectionView.constraint(top: self.yomojomoTitleView.bottomAnchor,
                                                   leading: self.yomojomoNewsContentView.leadingAnchor,
                                                   trailing: self.yomojomoNewsContentView.trailingAnchor,
                                                   padding: UIEdgeInsets(top: Size.yomojomoNewsCollectionviewAndTitleInterval , left: 0, bottom: 0, right: 0))
        self.yomojomoNewsCollectionView.constraint(.heightAnchor, constant: Size.yomojomoCollectionviewHeight)

        self.yomojomoNewsContentView.addSubview(self.slideGuideLabel)
        self.slideGuideLabel.constraint(bottom: self.yomojomoNewsContentView.bottomAnchor,
                                        centerX: self.yomojomoNewsContentView.centerXAnchor,
                                        padding: UIEdgeInsets(top: 0, left: 0, bottom: 24, right: 0))


        self.scrollView.addSubview(self.thisWeekNewsContentView)
        self.thisWeekNewsContentView.constraint(top: self.yomojomoNewsContentView.bottomAnchor,
                                                leading: self.scrollView.leadingAnchor,
                                                bottom: self.scrollView.bottomAnchor,
                                                trailing: self.scrollView.trailingAnchor,
                                                padding: UIEdgeInsets.zero)
        self.thisWeekNewsContentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        self.thisWeekNewsContentView.constraint(.heightAnchor, constant: Size.contentviewHeight)


        self.thisWeekNewsContentView.addSubview(self.thisWeekTitleView)
        self.thisWeekTitleView.constraint(top: self.thisWeekNewsContentView.topAnchor,
                                          leading: self.thisWeekNewsContentView.leadingAnchor,
                                          trailing: self.thisWeekNewsContentView.trailingAnchor,
                                          padding: UIEdgeInsets(top: 40, left: 0, bottom: 0, right: 0))

        self.thisWeekNewsContentView.addSubview(self.thisWeekNewsCollectionView)
        self.thisWeekNewsCollectionView.constraint(top: self.thisWeekTitleView.bottomAnchor,
                                                   leading: self.thisWeekNewsContentView.leadingAnchor,
                                                   bottom: self.thisWeekNewsContentView.bottomAnchor,
                                                   trailing: self.thisWeekNewsContentView.trailingAnchor,
                                                   padding: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0))
    }
}

// MARK: - UICollectionViewDataSource
extension YomojomoNewsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case self.yomojomoNewsCollectionView:
            return self.newsData.count
        case self.thisWeekNewsCollectionView:
            return self.newsData.count
        default:
            return 0
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let hasTitle = newsData[indexPath.row].title != nil

        switch (collectionView, hasTitle) {
        case (self.yomojomoNewsCollectionView, _):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: YomojomoNewsCollectionViewCell.className, for: indexPath) as! YomojomoNewsCollectionViewCell
            cell.setData(with: newsData[indexPath.row])
            cell.calculateLabelWidth(newsData[indexPath.row])
            return cell
        case (self.thisWeekNewsCollectionView, true):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ThisWeekNewsCollectionViewCell.className, for: indexPath) as? ThisWeekNewsCollectionViewCell else { return UICollectionViewCell() }
            cell.setData(newsData[indexPath.row])
            cell.calculateLabelWidth(newsData[indexPath.row])
            return cell
        case (self.thisWeekNewsCollectionView, false):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EmptySpaceCollectionViewCell.className, for: indexPath) as? EmptySpaceCollectionViewCell else { return UICollectionViewCell() }
            return cell
        default:
            return UICollectionViewCell()
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension YomojomoNewsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case self.yomojomoNewsCollectionView:
            return CGSize(width: Size.yomojomoCollectionviewWidth, height: Size.yomojomoCollectionviewHeight)
        case self.thisWeekNewsCollectionView:
            var width: CGFloat
            if self.newsData[indexPath.item].title?.count ?? 0 > Size.standardOfTitle {
                width = ((collectionView.frame.width - (Size.cellInterval * 4)) / Size.column) * 2 + Size.cellInterval
            } else {
                width = (collectionView.frame.width - (Size.cellInterval * 4)) / Size.column - 0.00000001
            }
            return CGSize(width: width, height: Size.cellHeight)
        default:
            return CGSize()
        }
    }
}

// MARK: - UICollectionViewDelegate
extension YomojomoNewsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "News", bundle: nil)
        guard let newsViewController = storyboard.instantiateViewController(withIdentifier: ReadingNewsViewController.className) as? ReadingNewsViewController else { return }
        
        newsViewController.modalTransitionStyle = .crossDissolve
        newsViewController.modalPresentationStyle = .fullScreen

        self.present(newsViewController, animated: true)
    }
}
