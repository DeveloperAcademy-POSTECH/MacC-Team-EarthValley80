//
//  QuestionTitleStackView.swift
//  EarthValley80
//
//  Created by SHIN YOON AH on 2022/10/27.
//

import UIKit

final class QuestionTitleStackView: UIStackView {

    // MARK: - property
    
    let captionLabel: UILabel = {
        let label = UILabel()
        label.font = .font(.bold, ofSize: 12)
        label.lineBreakStrategy = .hangulWordPriority
        // TODO: - 색상이 확정되면 추가
        label.textColor = .lightGray
        return label
    }()
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .font(.bold, ofSize: 20)
        // TODO: - 색상이 확정되면 추가
        label.textColor = .black
        return label
    }()
    private let innerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.distribution = .fill
        return stackView
    }()
    private let fiveWsOneHCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        return collectionView
    }()
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupLayout()
        self.configureUI()
    }
    
    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - func
    
    private func setupLayout() {
        self.layoutMargins = UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 20)
        self.isLayoutMarginsRelativeArrangement = true
        
        self.addArrangedSubview(self.captionLabel)
        self.addArrangedSubview(self.titleLabel)
        self.addArrangedSubview(self.innerStackView)
    }
    
    private func configureUI() {
        self.axis = .vertical
        self.spacing = 12
        self.alignment = .fill
        self.distribution = .fill
    }
}
