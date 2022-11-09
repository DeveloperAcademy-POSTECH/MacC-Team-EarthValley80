//
//  AlertViewController.swift
//  EarthValley80
//
//  Created by LeeJiSoo on 2022/11/09.
//

import UIKit

class AlertViewController: UIViewController {

    private enum Size {

    }

    // MARK: - property

    private var lottieName: String?
    private var smallTitle: String?
    private var bigTitle: String?
    private var contentView: UIView?

    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .evyWhite
        view.layer.cornerRadius = 16
        // 팝업이 등장할 때(viewWillAppear)에서 containerView.transform = .identity로 하여 애니메이션 효과 주는 용도
        view.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        return view
    }()
    private let containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 24
        return stackView
    }()
    private let titleStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()
    private let alertButtonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        return stackView
    }()
    private let actionSheetButtonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()
    private let buttonDivider: UIView = {
        let view = UIView()
        view.backgroundColor = .evyGray3
        return view
    }()
    // TODO: - 추후 로티view로 변경되어야 합니다.
    private let alertImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        return imageView
    }()
    private let alertSmallTitle: UILabel = {
        let label = UILabel()
        return label
    }()
    private let alertBigTitle: UILabel = {
        let label = UILabel()
        return label
    }()

    // MARK: - init

    convenience init(lottieName: String, smallTitle: String, bitTitle: String) {
        self.init()
        self.lottieName = lottieName
        self.smallTitle = smallTitle
        self.bigTitle = bigTitle
        self.modalPresentationStyle = .overFullScreen
    }

    convenience init(contentView: UIView) {
        self.init()
        self.contentView = contentView
        self.modalPresentationStyle = .overFullScreen
    }

    // MARK: - life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    // MARK: - func

}
