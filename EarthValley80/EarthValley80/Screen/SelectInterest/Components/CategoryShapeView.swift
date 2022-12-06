//
//  CategoryShapeView.swift
//  EarthValley80
//
//  Created by LeeJiSoo on 2022/11/23.
//

import UIKit

final class CategoryShapeView: UIView {

    private enum CategoryBackground : String {
        case society = "사회"
        case world = "세계"
        case history = "역사"
        case robot = "로봇"
        case environment = "환경"
        case health = "건강"
        case animal = "동물"
        case space = "우주"
        case science = "과학"
        case company = "회사"
        case money = "돈"
        case economyIT = "IT"
        case economy = "경제"
        case art = "예술"
        case broadcast = "방송"
        case exercise = "운동"
        case culture = "문화"

        var name: String {
            switch self {
            case .society:
                return "society"
            case .world:
                return "world"
            case .history:
                return "history"
            case .robot:
                return "robot"
            case .environment:
                return "environment"
            case .health:
                return "health"
            case .animal:
                return "animal"
            case .space:
                return "space"
            case .science:
                return "science"
            case .company:
                return "company"
            case .money:
                return "money"
            case .economyIT:
                return "economyIT"
            case .economy:
                return "economy"
            case .art:
                return "art"
            case .broadcast:
                return "broadcast"
            case .exercise:
                return "exercise"
            case .culture:
                return "culture"
            }
        }
    }

    // MARK: - property

    var isSelected: Bool = false {
        didSet {
            switch self.isSelected {
            case true:
                self.cagtegoryShapeViewSize = 280
            default:
                self.cagtegoryShapeViewSize = 200
            }
            self.CategoryShapeViewWidthConstraint?[.widthAnchor]?.constant = self.cagtegoryShapeViewSize
            self.CategoryShapeViewHeightConstraint?[.heightAnchor]?.constant = self.cagtegoryShapeViewSize
        }
    }

    private let backgroundImage: UIImageView = {
        let backgroundview = UIImageView()
        backgroundview.contentMode = .scaleAspectFit
        return backgroundview
    }()
    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.textColor = .evyWhite
        // TODO: - 화면 비율에 맞게 글자 크기도 조절해줘야합니다.
        label.font = .font(.regular, ofSize: 18)
        label.textAlignment = .center
        return label
    }()

    private var cagtegoryShapeViewSize: CGFloat = 200
    private var CategoryShapeViewWidthConstraint: [Frame: NSLayoutConstraint]?
    private var CategoryShapeViewHeightConstraint: [Frame: NSLayoutConstraint]?

    // MARK: - init

    init(image: UIImage, labelText: String) {
        super.init(frame: .zero)
        self.backgroundImage.image = image
        self.categoryLabel.text = labelText
        self.setupLayout()
        self.setupGesture()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // MARK: - func

    private func setupGesture() {
        self.isUserInteractionEnabled = true

        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.didTappedCategory(_:)))
        self.addGestureRecognizer(gesture)
    }

    private func setupLayout() {
        self.CategoryShapeViewWidthConstraint = self.constraint(.widthAnchor, constant: 200.adjustedWidth)
        self.CategoryShapeViewHeightConstraint = self.constraint(.heightAnchor, constant: 200.adjustedHeight)

        self.addSubview(self.backgroundImage)
        self.backgroundImage.constraint(top: self.topAnchor,
                                        leading: self.leadingAnchor,
                                        padding: UIEdgeInsets.zero)

        self.addSubview(self.categoryLabel)
        self.categoryLabel.constraint(centerX: self.backgroundImage.centerXAnchor,
                                      centerY: self.backgroundImage.centerYAnchor,
                                      padding: UIEdgeInsets.zero)
    }

    // MARK: - selector

    @objc
    func didTappedCategory(_ sender: UITapGestureRecognizer) {
        // TODO: - 클릭된 카테고리를 저장해야 합니다. (user defaults)
        guard let categoryText = self.categoryLabel.text else { return }
        guard let type = CategoryBackground(rawValue: categoryText) else { return }

        if self.isSelected {
            self.isSelected = false
            self.backgroundImage.image = UIImage(named: type.name)
        } else {
            self.isSelected = true
            self.backgroundImage.image = UIImage(named: "selected_"+type.name)
        }
    }
}
