//
//  UserGoalAttainmentLottieCollectionViewCell.swift
//  EarthValley80
//
//  Created by LeeJiSoo on 2022/11/06.
//

import UIKit

import Lottie

final class UserGoalAttainmentLottieCollectionViewCell: UICollectionViewCell {

    private enum attainmentLabelText: Int {
        case attainment1 = 0
        case attainment3 = 3
        case attainment6 = 6
        case attainment10 = 10
        case attainment13 = 13
        case attainment15 = 15
        case attainment20 = 20
        case attainment25 = 25
        case attainment30 = 30
        case attainment35 = 35
        case attainment40 = 40
        case attainment45 = 45
        case attainment50 = 50

        var labelText: String {
            switch self {
            case .attainment1:
                return "드디어 첫 기사를 썼군요!"
            case .attainment3:
                return "와우 벌써 3개!"
            case .attainment6:
                return "지금처럼 천천히 조금씩 나아가는거에요"
            case .attainment10:
                return "축하합니다, 10개의 기사를 요약한 당신은 요모조모 달인!"
            case .attainment13:
                return "꾸준히 글을 쓰는 모습이 정말 아름다워요!"
            case .attainment15:
                return "꾸준히 앞으로 나아가고 있군요?"
            case .attainment20:
                return "지금처럼 천천히 조금씩 나아가는거에요"
            case .attainment25:
                return "멋져요! 벌써 25개나 달성!"
            case .attainment30:
                return "30개 달성! 당신은 요모조모에게 특별한 사람이에요"
            case .attainment35:
                return "꾸준히 앞으로 나아가고 있군요?"
            case .attainment40:
                return "와우, 대단한데요 40개째에요!"
            case .attainment45:
                return "지금처럼 천천히 조금씩 나아가는거에요"
            case .attainment50:
                return "축하합니다, 50개의 기사를 요약한 당신은 요모조모 그자체"
            }
        }
    }

    // MARK: - property

    override var isSelected: Bool {
        didSet {
            if self.isSelected {
                self.lottieView.play()
            }
        }
    }
    private lazy var attainmentLabel: UILabel = {
        let label = UILabel()
        label.font = .font(.bold, ofSize: 10)
        label.textAlignment = .center
        return label
    }()
    private lazy var lottieView: LottieAnimationView = {
        let animationView = LottieAnimationView(name: lottieName)
        animationView.play()
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .repeat(2)
        return animationView
    }()
    private lazy var lottieName: String = ""

    // MARK: - init

    override init(frame: CGRect) {
        super .init(frame: frame)
        self.setupLayout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    // MARK: - func

    private func setupLayout() {
        self.contentView.addSubview(self.lottieView)
        self.lottieView.constraint(top: self.contentView.topAnchor,
                                   leading: self.contentView.leadingAnchor,
                                   trailing: self.contentView.trailingAnchor,
                                   padding: UIEdgeInsets(top: 30, left: 28, bottom: 0, right: 28))
        self.lottieView.constraint(.heightAnchor, constant: (self.bounds.size.width - 56) * 0.752)

        self.contentView.addSubview(self.attainmentLabel)
        self.attainmentLabel.constraint(leading: self.lottieView.leadingAnchor,
                                        bottom: self.contentView.bottomAnchor,
                                        trailing: self.lottieView.trailingAnchor,
                                        padding: UIEdgeInsets(top: 0, left: 0, bottom: 24, right: 0))
    }

    func setLottieImage(to lottieName: String) {
        self.lottieName = lottieName
    }

    func setLottieLabel(index: Int) {
        self.attainmentLabel.text = attainmentStamp.init(rawValue: index)?.labelText
    }
}
