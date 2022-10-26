//
//  TitleInferingViewController.swift
//  EarthValley80
//
//  Created by SHIN YOON AH on 2022/10/25.
//

import UIKit

private extension UIColor {
    static var originalTextColor: UIColor {
        return .white.withAlphaComponent(0.2)
    }
}

final class TitleInferingViewController: UIViewController {
    
    private enum Size {
        static let verticalPadding: CGFloat = 16.0
        static let contentHeight: CGFloat = UIScreen.main.bounds.size.height * 0.63
        static let questionViewFrameWidth: CGFloat = UIScreen.main.bounds.size.width * 0.48
        static let partOfQuestionViewFrameWidth = questionViewFrameWidth - 20
    }
    
    private enum Direction {
        case left
        case right
        
        var offset: CGFloat {
            switch self {
            case .left:
                return 16
            case .right:
                return Size.partOfQuestionViewFrameWidth
            }
        }
    }
    
    // MARK: - property
    
    private let blurContentLabel: BlurredLabel = {
        let label = BlurredLabel()
        label.isBlurring = true
        label.numberOfLines = 0
        label.font = .font(.bold, ofSize: 34)
        label.textColor = .originalTextColor
        
        //TODO: - 더미 데이터, 나중에 지우겠습니다.
        label.text = """
        ‘타다’는 승합차를 유료로 타려는 이용자와 운전자를 연결해주는 차량공유 앱 서비스입니다. 승합차는 일반 택시보다 크고 마을버스보다 작은 차종을 말합니다. 대개 11~15인승입니다. 2018년 10월 ‘타다’라는 글자를 새긴 차가 처음 시장에 등장했습니다.
        미국에서 차량공유 서비스인 ‘우버’가 주목받은 터여서 타다는 한국식 우버로 불리기도 했습니다.

        문제가 발생했습니다. 택시업계가 반발한 겁니다. “택시 면허가 없는 사람들이 택시 영업을 한다”고 주장했고 수사당국인 검찰이 1년 뒤인 2019년 10월 타다 운영업체 VCNC의 박재욱 대표와 모기업 쏘카의 이재웅 대표를 재판에 넘겼습니다. 1심과 2심 법원은 모두 ‘타다 무죄’를 선고했습니다.
        ‘모바일 앱과 승합차를 잇는 혁신 서비스’인지, ‘무면허 택시 영업행위’인지를 놓고 양측이 3년간 치열하게 싸웠습니다.

        누가 재판에 이겼느냐는 우리의 관심사가 아닙니다. 타다 재판의 이면에 웅크리고 있는 생각들에 주목해야 합니다. 혁신과 기득권의 대립, 새로운 것과 기존에 있던 것 사이의 충돌, 현재와 미래, 진화와 도태 같은 이슈들이죠.
        """
        label.setLineSpacing(kernValue: -2.0, lineHeightMultiple: 1.16)
        
        return label
    }()
    private let titleView = NewsTitleHeaderView()
    private let backButton = BackButton()
    private let questionView: QuestionView = {
        let view = QuestionView()
        view.captionText = StringLiteral.inferingNewsCaptionTitle
        view.titleText = StringLiteral.inferingNewsTitle
        return view
    }()
    
    private var questionViewConstraints: [ConstraintType: NSLayoutConstraint]?
    
    // MARK: - life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupLayout()
        self.configureUI()
        self.openQuestionView()
    }
    
    // MARK: - func
    
    private func setupLayout() {
        self.view.addSubview(self.questionView)
        questionViewConstraints = self.questionView.constraint(top: self.view.topAnchor,
                                     bottom: self.view.bottomAnchor,
                                     trailing: self.view.trailingAnchor,
                                     padding: UIEdgeInsets(top: Size.verticalPadding, left: 0, bottom: Size.verticalPadding, right: -Size.partOfQuestionViewFrameWidth))
        
        self.view.addSubview(self.backButton)
        self.backButton.constraint(top: self.view.topAnchor,
                                   leading: self.view.leadingAnchor,
                                   padding: UIEdgeInsets(top: 26, left: 10, bottom: 0, right: 0))
        
        self.view.addSubview(self.blurContentLabel)
        self.blurContentLabel.constraint(leading: self.view.leadingAnchor,
                                         bottom: self.view.bottomAnchor,
                                         trailing: self.questionView.leadingAnchor,
                                         padding: UIEdgeInsets(top: 0, left: 90, bottom: 0, right: 90))
        self.blurContentLabel.constraint(.heightAnchor, constant: Size.contentHeight)
        
        self.view.addSubview(self.titleView)
        self.titleView.constraint(top: self.backButton.bottomAnchor,
                                  leading: self.view.leadingAnchor,
                                  bottom: self.blurContentLabel.topAnchor,
                                  trailing: self.questionView.leadingAnchor,
                                  padding: UIEdgeInsets(top: 30, left: 0, bottom: 0, right: 0))
        
    }
    
    private func configureUI() {
        // TODO: - background gradient Color가 나오면 적용
        self.view.backgroundColor = .black
    }
    
    private func openQuestionView() {
        let deadlineTime: DispatchTime = DispatchTime.now() + 1.15
        
        DispatchQueue.main.asyncAfter(deadline: deadlineTime, execute: {
            self.moveQuestionView(to: .left)
        })
    }
    
    private func moveQuestionView(to direction: Direction) {
        let durationTime: CGFloat = 0.9
        
        UIView.animate(withDuration: durationTime, animations: {
            self.questionViewConstraints?[.trailing]?.constant = -direction.offset
            self.view.layoutIfNeeded()
        })
    }
}
