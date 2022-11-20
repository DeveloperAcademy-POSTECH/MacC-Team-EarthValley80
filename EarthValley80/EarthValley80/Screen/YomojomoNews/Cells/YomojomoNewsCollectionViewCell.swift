//
//  YomojomoNewsCollectionViewCell.swift
//  EarthValley80
//
//  Created by LeeJiSoo on 2022/11/20.
//

import UIKit

class YomojomoNewsCollectionViewCell: UICollectionViewCell {

    private enum Size {

    }

    // MARK: - property

    private let cellBackground: UIView =  {
        let backgroundview = UIView()
        backgroundview.backgroundColor = .systemPink
        return backgroundview
    }()
    private let categoryBackgroundImageView: UIImageView = {
        let imageview = UIImageView()
        imageview.contentMode = .scaleToFill
        imageview.clipsToBounds = true
        imageview.layer.cornerRadius = 12.0
        imageview.backgroundColor = .red
        return imageview
    }()
    private let newsImageView: UIImageView = {
        let imageview = UIImageView()
        imageview.contentMode = .scaleToFill
        imageview.clipsToBounds = true
        imageview.layer.cornerRadius = 12.0
        imageview.backgroundColor = .blue
        return imageview
    }()
    private let newsCategoryLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .font(.bold, ofSize: 16)
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 10
        label.backgroundColor = .evyWhite
        label.layer.opacity = 0.6
        return label
    }()
    private let newsTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "이건뉴스 기사 제목이지롱 어때 이건 바로 테스트야!"
        return label
    }()
}
