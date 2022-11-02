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
        static let buttonFontSize: CGFloat = 16.0
        static let buttonHeigth: CGFloat = 50.0
        static let buttonImageSize: UIImage.SymbolConfiguration = UIImage.SymbolConfiguration(pointSize: 35)
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
        self.invalidateIntrinsicContentSize()
        self.titleLabel?.textAlignment = .center
        self.backgroundColor = .evyBlack1
        self.imageView?.contentMode = .scaleAspectFit
        self.constraint(.heightAnchor, constant: Size.buttonHeigth)

        // TODO: - 15버젼에서 contentinset넣어야하고, cornerradius넣어야함
        if #available(iOS 15.0, *) {
            configuration?.preferredSymbolConfigurationForImage = Size.buttonImageSize
        } else {
            self.contentEdgeInsets = UIEdgeInsets(top: 8, left: 10, bottom: 8, right: 30)
        }
    }
}
