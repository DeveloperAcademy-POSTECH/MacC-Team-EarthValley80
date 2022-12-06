//
//  CategoryShapeView.swift
//  EarthValley80
//
//  Created by LeeJiSoo on 2022/11/23.
//

import UIKit

class CategoryShapeView: UIView {

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

        var imageName: String {
            switch self {
            case .society:
                return "selected_society"
            case .world:
                return "selected_world"
            case .history:
                return "selected_history"
            case .robot:
                return "selected_robot"
            case .environment:
                return "selected_environment"
            case .health:
                return "selected_health"
            case .animal:
                return "selected_animal"
            case .space:
                return "selected_space"
            case .science:
                return "selected_science"
            case .company:
                return "selected_company"
            case .money:
                return "selected_money"
            case .economyIT:
                return "selected_economyIT"
            case .economy:
                return "selected_economy"
            case .art:
                return "selected_art"
            case .broadcast:
                return "selected_broadcast"
            case .exercise:
                return "selected_exercise"
            case .culture:
                return "selected_culture"
            }
        }
    }
    // MARK: - property

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
        guard let categoryText = categoryLabel.text else { return }
        guard let type = CategoryBackground(rawValue: categoryText) else { return }
        backgroundImage.image = UIImage(named: type.imageName)
        // TODO: - 클릭된 카테고리를 저장해야 합니다. (user defaults?)
    }
}
