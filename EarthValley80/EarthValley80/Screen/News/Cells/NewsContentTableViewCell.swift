//
//  NewsContentTableViewCell.swift
//  EarthValley80
//
//  Created by SHIN YOON AH on 2022/10/25.
//

import UIKit

private extension UIColor {
    static var originalTextColor: UIColor {
        return .white.withAlphaComponent(0.2)
    }
    
    static var highlightTextColor: UIColor {
        return .white
    }
}

final class NewsContentTableViewCell: UITableViewCell {
    
    private enum Size {
        static let horizontalPadding: CGFloat = 90.0
    }
    
    // MARK: - property
    
    private let contentLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 34, weight: .bold)
        label.textColor = .originalTextColor
        
        //TODO: - 더미 데이터, 나중에 지우겠습니다.
        label.text = """
        ‘타다’는 승합차를 유료로 타려는 이용자와 운전자를 연결해주는 차량공유 앱 서비스입니다. 승합차는 일반 택시보다 크고 마을버스보다 작은 차종을 말합니다. 대개 11~15인승입니다. 2018년 10월 ‘타다’라는 글자를 새긴 차가 처음 시장에 등장했습니다. 미국에서 차량공유 서비스인 ‘우버’가 주목받은 터여서 타다는 한국식 우버로 불리기도 했습니다.

        문제가 발생했습니다. 택시업계가 반발한 겁니다. “택시 면허가 없는 사람들이 택시 영업을 한다”고 주장했고 수사당국인 검찰이 1년 뒤인 2019년 10월 타다 운영업체 VCNC의 박재욱 대표와 모기업 쏘카의 이재웅 대표를 재판에 넘겼습니다. 1심과 2심 법원은 모두 ‘타다 무죄’를 선고했습니다. ‘모바일 앱과 승합차를 잇는 혁신 서비스’인지, ‘무면허 택시 영업행위’인지를 놓고 양측이 3년간 치열하게 싸웠습니다.

        누가 재판에 이겼느냐는 우리의 관심사가 아닙니다. 타다 재판의 이면에 웅크리고 있는 생각들에 주목해야 합니다. 혁신과 기득권의 대립, 새로운 것과 기존에 있던 것 사이의 충돌, 현재와 미래, 진화와 도태 같은 이슈들이죠.
        """
        label.setLineSpacing(lineHeightMultiple: 1.16)
        
        return label
    }()

    // MARK: - init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupLayout()
        self.configureUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - func
    
    private func setupLayout() {
        self.contentView.addSubview(self.contentLabel)
        self.contentLabel.constraint(top: contentView.topAnchor,
                                     leading: contentView.leadingAnchor,
                                     bottom: contentView.bottomAnchor,
                                     trailing: contentView.trailingAnchor,
                                     padding: UIEdgeInsets(top: 0, left: Size.horizontalPadding, bottom: 0, right: Size.horizontalPadding))
    }
    
    private func configureUI() {
        self.backgroundColor = .clear
        self.selectionStyle = .none
    }
}
