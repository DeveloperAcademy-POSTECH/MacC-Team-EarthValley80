//
//  QuestionTitleStackView.swift
//  EarthValley80
//
//  Created by SHIN YOON AH on 2022/10/27.
//

import UIKit

final class QuestionTitleStackView: UIStackView {
    
    // MARK: - property
    
    var isHiddenCollectionView: Bool? {
        willSet {
            self.fiveWsOneHCollectionView.isHidden = newValue ?? false
        }
    }
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
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.layoutMargins = UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 20)
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    private lazy var fiveWsOneHCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.dataSource = self
        collectionView.register(AnswerCollectionViewCell.self, forCellWithReuseIdentifier: AnswerCollectionViewCell.className)
        return collectionView
    }()

    private let captions: [String] = [StringLiteral.answerCellWhoCaptionTitle,
                                      StringLiteral.answerCellWhenCaptionTitle,
                                      StringLiteral.answerCellWhereCaptionTitle,
                                      StringLiteral.answerCellWhatCaptionTitle,
                                      StringLiteral.answerCellHowCaptionTitle,
                                      StringLiteral.answerCellWhyCaptionTitle]
    var answers: [String] = Array(repeating: "", count: 6) {
        didSet {
            self.fiveWsOneHCollectionView.reloadData()
        }
    }
    
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
        self.addArrangedSubview(self.innerStackView)
        self.addArrangedSubview(self.fiveWsOneHCollectionView)
        self.innerStackView.addArrangedSubview(self.captionLabel)
        self.innerStackView.addArrangedSubview(self.titleLabel)
        
        self.fiveWsOneHCollectionView.constraint(.heightAnchor, constant: 42)
    }
    
    private func configureUI() {
        self.axis = .vertical
        self.spacing = 23
        self.alignment = .fill
        self.distribution = .fill
    }
}

// MARK: - UICollectionViewDataSource
extension QuestionTitleStackView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let filteredAnswers = self.answers.filter { $0 != "" }
        return filteredAnswers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: AnswerCollectionViewCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
        let index = indexPath.item
        cell.setupAnswerCell(of: self.captions[index], answer: self.answers[index])
        return cell
    }
}
