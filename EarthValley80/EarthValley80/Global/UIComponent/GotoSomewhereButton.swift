//
//  GotoSomewhereButton.swift
//  EarthValley80
//
//  Created by LeeJiSoo on 2022/11/02.
//

import UIKit

final class GotoSomewhereButton: UIButton {

    private enum Size {
        static let buttonContentEdgeIneset: CGFloat = -10.0
        static let buttonCornerRadius: CGFloat = 26.5
        static let buttonFontSize: CGFloat = 16.0
    }

    // MARK: - init

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - func

    private func configureUI() {
        self.backgroundColor = .evyBlack1
        self.titleLabel?.font = .font(.medium, ofSize: Size.buttonFontSize)
        self.contentMode = .scaleToFill
        self.imageEdgeInsets = UIEdgeInsets(top: Size.buttonContentEdgeIneset,
                                            left: Size.buttonContentEdgeIneset,
                                            bottom: Size.buttonContentEdgeIneset,
                                            right: 0)
        self.titleEdgeInsets = UIEdgeInsets(top: 0, left: Size.buttonContentEdgeIneset, bottom: 0, right: 0)
        self.imageView?.contentMode = .scaleAspectFit
        self.layer.cornerRadius = Size.buttonCornerRadius
    }
}
