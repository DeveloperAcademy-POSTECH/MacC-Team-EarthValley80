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

    private let scrollView: UIScrollView = {
        let scrollview = UIScrollView()
        scrollview.translatesAutoresizingMaskIntoConstraints = false
        scrollview.backgroundColor = .blue
        return scrollview
    }()
    private let yomojomoNewsContentView: UIView = {
        let contentview = UIView()
        contentview.backgroundColor = .red
        return contentview
    }()
    private let yomojomoTitleView: MainTitleView = {
        let titleView = MainTitleView()
        titleView.changeLabelText(date: Date().dateFormatted("EEEE, MM d"),
                                  title: StringLiteral.yomojomoNewsTitle,
                                  description: StringLiteral.yomojomoNewsTitleDescription)
        return titleView
    }()
    private lazy var yomojomoNewsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 113
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(YomojomoNewsCollectionViewCell.self, forCellWithReuseIdentifier: YomojomoNewsCollectionViewCell.className)
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
                                  title: "이번주 뉴스",
                                  description: "마음에 드는 제목의 뉴스를 선택하여 읽어보세요!")
        return titleView
    }()
    private lazy var thisWeekNewsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = Size.cellInterval
        layout.minimumInteritemSpacing = Size.cellInterval
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ThisWeekNewsCollectionViewCell.self, forCellWithReuseIdentifier: ThisWeekNewsCollectionViewCell.className)
        collectionView.register(EmptySpaceCollectionViewCell.self, forCellWithReuseIdentifier: EmptySpaceCollectionViewCell.className)
        return collectionView
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
        self.yomojomoNewsContentView.constraint(.heightAnchor, constant: UIScreen.main.bounds.size.height - 100)

        self.yomojomoNewsContentView.addSubview(self.yomojomoTitleView)
        self.yomojomoTitleView.constraint(top: self.yomojomoNewsContentView.topAnchor,
                                          leading: self.yomojomoNewsContentView.leadingAnchor,
                                          trailing: self.yomojomoNewsContentView.trailingAnchor,
                                          padding: UIEdgeInsets(top: 80, left: 0, bottom: 0, right: 0))

        self.yomojomoNewsContentView.addSubview(self.thisWeekNewsCollectionView)
        self.thisWeekNewsCollectionView.constraint(top: self.yomojomoTitleView.bottomAnchor,
                                                   leading: self.yomojomoNewsContentView.leadingAnchor,
                                                   bottom: self.yomojomoNewsContentView.bottomAnchor,
                                                   trailing: self.yomojomoNewsContentView.trailingAnchor,
                                                   padding: UIEdgeInsets(top: 37, left: 0, bottom: 0, right: 0))

        self.scrollView.addSubview(self.thisWeekNewsContentView)
        self.thisWeekNewsContentView.constraint(top: self.yomojomoNewsContentView.bottomAnchor,
                                                leading: self.scrollView.leadingAnchor,
                                                bottom: self.scrollView.bottomAnchor,
                                                trailing: self.scrollView.trailingAnchor,
                                                padding: UIEdgeInsets.zero)
        self.thisWeekNewsContentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        self.thisWeekNewsContentView.constraint(.heightAnchor, constant: UIScreen.main.bounds.size.height - 100)


        self.thisWeekNewsContentView.addSubview(self.thisWeekTitleView)
        self.thisWeekTitleView.constraint(top: self.thisWeekNewsContentView.topAnchor,
                                          leading: self.thisWeekNewsContentView.leadingAnchor,
                                          trailing: self.thisWeekNewsContentView.trailingAnchor,
                                          padding: UIEdgeInsets(top: 40, left: 0, bottom: 0, right: 0))
    }
}

// MARK: - UICollectionViewDataSource
extension YomojomoNewsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.newsData.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if collectionView == yomojomoNewsCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: YomojomoNewsCollectionViewCell.className, for: indexPath) as! YomojomoNewsCollectionViewCell
            cell.setData(newsData[indexPath.row])
            cell.calculateLabelWidth(newsData[indexPath.row])
            return cell
        } else if collectionView == thisWeekNewsCollectionView {
            if newsData[indexPath.row].title == nil {
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EmptySpaceCollectionViewCell.className, for: indexPath) as? EmptySpaceCollectionViewCell else { return UICollectionViewCell() }
                return cell
            } else {
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ThisWeekNewsCollectionViewCell.className, for: indexPath) as? ThisWeekNewsCollectionViewCell else { return UICollectionViewCell() }
                cell.setData(newsData[indexPath.row])
                cell.calculateLabelWidth(newsData[indexPath.row])
                return cell
            }
        }
        return UICollectionViewCell()
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension YomojomoNewsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        // MARK: - width 및 column 설정

        var width: CGFloat
        if newsData[indexPath.item].title?.count ?? 0 > Size.standardOfTitle {
            width = ((collectionView.frame.width - (Size.cellInterval * 4)) / Size.column) * 2 + Size.cellInterval
        } else {
            width = (collectionView.frame.width - (Size.cellInterval * 4)) / Size.column - 0.00000001
        }

        return CGSize(width: width, height: Size.cellHeight)
    }
}

// MARK: - UICollectionViewDelegate
extension YomojomoNewsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "News", bundle: nil)
        guard let newsViewController = storyboard.instantiateViewController(withIdentifier: TitleInferringViewController.className) as? TitleInferringViewController else { return }
        
        newsViewController.modalTransitionStyle = .crossDissolve
        newsViewController.modalPresentationStyle = .fullScreen
        
        self.present(newsViewController, animated: true)
    }
}
