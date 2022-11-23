//
//  CategoryShapeView.swift
//  EarthValley80
//
//  Created by LeeJiSoo on 2022/11/23.
//

import UIKit

final class CategoryShapeView: UIView {

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
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // MARK: - func

    private func setupLayout() {
        self.addSubview(self.backgroundImage)
        self.backgroundImage.constraint(top: self.topAnchor,
                                        leading: self.leadingAnchor,
                                        padding: UIEdgeInsets.zero)
        self.backgroundImage.constraint(.widthAnchor, constant: 200.adjustedWidth)
        self.backgroundImage.constraint(.heightAnchor, constant: 200.adjustedHeight)


        self.addSubview(self.categoryLabel)
        self.categoryLabel.constraint(centerX: self.backgroundImage.centerXAnchor,
                                      centerY: self.backgroundImage.centerYAnchor,
                                      padding: UIEdgeInsets.zero)
    }
}
