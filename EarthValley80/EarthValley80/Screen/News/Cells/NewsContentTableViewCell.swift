//
//  NewsContentTableViewCell.swift
//  EarthValley80
//
//  Created by SHIN YOON AH on 2022/10/25.
//

import UIKit

private extension UIColor {
    static var expandedTextColor: UIColor {
        return .white.withAlphaComponent(0.2)
    }
    
    static var compactTextColor: UIColor {
        return .white.withAlphaComponent(0.8)
    }
    
    static var highlightTextColor: UIColor {
        return .white
    }
}

final class NewsContentTableViewCell: UITableViewCell {
    
    private enum Size {
        static let horizontalPadding: CGFloat = 90.0
        static let minimumHorizontalPadding: CGFloat = 50.0
        static let originalFontSize: CGFloat = 34.0
        static let minimumFontSize: CGFloat = 20.0
        static let originalLineHeightMultiple: CGFloat = 1.16
        static let minimumLineHeightMultiple: CGFloat = 1.5
    }
    
    enum Status {
        case expanded
        case compact
        
        var fontSize: CGFloat {
            switch self {
            case .expanded:
                return Size.originalFontSize
            case .compact:
                return Size.minimumFontSize
            }
        }
        
        var horizontalPadding: CGFloat {
            switch self {
            case .expanded:
                return Size.horizontalPadding
            case .compact:
                return Size.minimumHorizontalPadding
            }
        }
        
        var lineHeightMultiple: CGFloat {
            switch self {
            case .expanded:
                return Size.originalLineHeightMultiple
            case .compact:
                return Size.minimumLineHeightMultiple
            }
        }
        
        var defaultTextColor: UIColor {
            switch self {
            case .expanded:
                return .expandedTextColor
            case .compact:
                return .compactTextColor
            }
        }
    }
    
    // MARK: - property
    
    private let contentLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        
        // TODO: - 더미 데이터
        label.text = """
        ‘타다’는 승합차를 유료로 타려는 이용자와 운전자를 연결해주는 차량공유 앱 서비스입니다. 승합차는 일반 택시보다 크고 마을버스보다 작은 차종을 말합니다. 대개 11~15인승입니다. 2018년 10월 ‘타다’라는 글자를 새긴 차가 처음 시장에 등장했습니다.
        미국에서 차량공유 서비스인 ‘우버’가 주목받은 터여서 타다는 한국식 우버로 불리기도 했습니다.

        문제가 발생했습니다. 택시업계가 반발한 겁니다. “택시 면허가 없는 사람들이 택시 영업을 한다”고 주장했고 수사당국인 검찰이 1년 뒤인 2019년 10월 타다 운영업체 VCNC의 박재욱 대표와 모기업 쏘카의 이재웅 대표를 재판에 넘겼습니다. 1심과 2심 법원은 모두 ‘타다 무죄’를 선고했습니다.
        ‘모바일 앱과 승합차를 잇는 혁신 서비스’인지, ‘무면허 택시 영업행위’인지를 놓고 양측이 3년간 치열하게 싸웠습니다.

        누가 재판에 이겼느냐는 우리의 관심사가 아닙니다. 타다 재판의 이면에 웅크리고 있는 생각들에 주목해야 합니다. 혁신과 기득권의 대립, 새로운 것과 기존에 있던 것 사이의 충돌, 현재와 미래, 진화와 도태 같은 이슈들이죠.
        """
        
        return label
    }()
    var status: Status? {
        willSet {
            guard let newValue = newValue else { return }
            
            self.contentLabel.textColor = newValue.defaultTextColor
            self.contentLabel.font = .font(.bold, ofSize: newValue.fontSize)
            self.contentLabel.setLineSpacing(kernValue: -2.0, lineHeightMultiple: newValue.lineHeightMultiple)
            self.setupLayout(status: newValue)
        }
    }
    private var sentences: [String] = []

    // MARK: - init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configureUI()
        self.appendSentences()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - func
    
    private func setupLayout(status: Status) {
        self.contentView.addSubview(self.contentLabel)
        self.contentLabel.constraint(to: self.contentView,
                                     insets: UIEdgeInsets(top: 0, left: status.horizontalPadding, bottom: 0, right: -status.horizontalPadding))
    }
    
    private func configureUI() {
        self.backgroundColor = .clear
        self.selectionStyle = .none
    }
    
    private func appendSentences() {
        guard let content = self.contentLabel.text else { return }
        self.sentences = self.makeSentences(with: content)
    }
    
    private func makeSentences(with content: String) -> [String] {
        guard content == "" else { return [] }
        return content.components(separatedBy: [".", "?", "!"]).map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }.filter { !$0.isEmpty }
    }
}
