//
//  CategoryShapeView.swift
//  EarthValley80
//
//  Created by LeeJiSoo on 2022/11/23.
//

import UIKit

class CategoryShapeView: UIView {

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
        print("여기다가 변경되는 이미지를 넣어야함")
        backgroundImage.image = UIImage(named: "money")
    }
}
