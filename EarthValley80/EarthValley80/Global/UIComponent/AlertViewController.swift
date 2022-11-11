//
//  AlertViewController.swift
//  EarthValley80
//
//  Created by LeeJiSoo on 2022/11/09.
//

import UIKit

class AlertViewController: UIViewController {

    private enum Size {
        static let alertWidth: CGFloat = 270
        static let alertHeight: CGFloat = 200 // 버튼갯수 * 높이로 조절
    }

    // MARK: - property

    private var lottieName: String?
    private var smallTitle: String?
    private var bigTitle: String?
    private var contentView: UIView?

    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .evyWhite
        view.layer.cornerRadius = 16
        // 팝업이 등장할 때(viewWillAppear)에서 containerView.transform = .identity로 하여 애니메이션 효과 주는 용도
        view.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        return view
    }()
    private lazy var containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 24
        return stackView
    }()
    private lazy var titleStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        return stackView
    }()
    private lazy var alertButtonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 0
        stackView.distribution = .fillEqually
        return stackView
    }()
    private lazy var actionSheetButtonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()
    private lazy var buttonDivider: UIView = {
        let view = UIView()
        view.backgroundColor = .evyGray3
        return view
    }()
    // TODO: - 추후 로티view로 변경되어야 합니다.
    private lazy var alertImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        return imageView
    }()
    private lazy var alertSmallTitle: UILabel = {
        let label = UILabel()
        return label
    }()
    private lazy var alertBigTitle: UILabel = {
        let label = UILabel()
        return label
    }()

    // MARK: - init

    convenience init(lottieName: String, smallTitle: String, bigTitle: String) {
        self.init()
        self.lottieName = lottieName
        self.smallTitle = smallTitle
        self.bigTitle = bigTitle
        self.modalPresentationStyle = .overFullScreen
    }

    // MARK: - life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setupLayout()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // curveEaseOut: 시작은 천천히, 끝날 땐 빠르게
        UIView.animate(withDuration: 0.1, delay: 0.0, options: .curveEaseOut) { [weak self] in
            self?.containerView.transform = .identity
            self?.containerView.isHidden = false
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // curveEaseIn: 시작은 빠르게, 끝날 땐 천천히
        UIView.animate(withDuration: 0.1, delay: 0.0, options: .curveEaseIn) { [weak self] in
            self?.containerView.transform = .identity
            self?.containerView.isHidden = true
        }
    }

    // MARK: - func

    private func configureUI() {
        view.backgroundColor = .black.withAlphaComponent(0.2)
    }

    private func setupLayout() {
        self.view.addSubview(containerView)
        self.containerView.constraint(centerX: self.view.centerXAnchor,
                                      centerY: self.view.centerYAnchor,
                                      padding: UIEdgeInsets.zero)
        self.containerView.constraint(.widthAnchor, constant: Size.alertWidth)
        self.containerView.constraint(.heightAnchor, constant: Size.alertHeight)

        self.containerView.addSubview(containerStackView)
        self.containerStackView.constraint(.widthAnchor, constant: Size.alertWidth)
        self.containerStackView.constraint(.heightAnchor, constant: Size.alertHeight)
        self.containerStackView.addArrangedSubview(titleStackView)
        self.containerStackView.addArrangedSubview(alertButtonStackView)

        self.titleStackView.addArrangedSubview(alertImageView)
        self.titleStackView.addArrangedSubview(alertSmallTitle)
        self.titleStackView.addArrangedSubview(alertBigTitle)
        self.titleStackView.setCustomSpacing(10, after: alertImageView)
        self.titleStackView.setCustomSpacing(6, after: alertSmallTitle)
        self.alertImageView.constraint(.widthAnchor, constant: 82)
        self.alertImageView.constraint(.heightAnchor, constant: 60)
    }

    public func addActionToButton(title: String? = nil,
                                  titleColor: UIColor = .white,
                                  backgroundColor: UIColor = .blue,
                                  completion: (() -> Void)? = nil) {
        let button = UIButton()
        button.titleLabel?.font = .font(.bold, ofSize: 16)
        // enable
        button.setTitle(title, for: .normal)
        button.setTitleColor(.evyBlack2, for: .normal)
        // disable
        button.setTitleColor(.evyGray3, for: .disabled)
        button.addAction(for: .touchUpInside) { _ in
            completion?()
        }
        self.alertButtonStackView.addArrangedSubview(button)
        self.alertButtonStackView.constraint(.widthAnchor, constant: 270)
        // TODO: - 개수에 따라서 빠꿔줘야하는데,,
        self.alertButtonStackView.constraint(.heightAnchor, constant: 50)
    }
}

// MARK: - UIControl extension
extension UIControl {
    public typealias UIControlTargetClosure = (UIControl) -> ()

    private class UIControlClosureWrapper: NSObject {
        let closure: UIControlTargetClosure
        init(_ closure: @escaping UIControlTargetClosure) {
            self.closure = closure
        }
    }

    private struct AssociatedKeys {
        static var targetClosure = "targetClosure"
    }

    private var targetClosure: UIControlTargetClosure? {
        get {
            guard let closureWrapper = objc_getAssociatedObject(self, &AssociatedKeys.self.targetClosure) as? UIControlClosureWrapper else { return nil }
            return closureWrapper.closure

        } set(newValue) {
            guard let newValue = newValue else { return }
            objc_setAssociatedObject(self, &AssociatedKeys.self.targetClosure, UIControlClosureWrapper(newValue),
                                     objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }

    @objc func closureAction() {
        guard let targetClosure = self.targetClosure else { return }
        targetClosure(self)
    }

    public func addAction(for event: UIControl.Event, closure: @escaping UIControlTargetClosure) {
        self.targetClosure = closure
        addTarget(self, action: #selector(UIControl.closureAction), for: event)
    }
}

// TODO: - testcode 삭제해야합니다!!!! ------------------------------------------------

final class TempViewController: UIViewController {

    private let tempbutton: GotoSomewhereButton = {
        let button = GotoSomewhereButton()
        button.setImage(UIImage(named: "ico_news"), for: .normal)
        button.setTitle("헬로헤로", for: .normal)
        button.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        setupLayout()
    }

    private func setupLayout() {
        view.addSubview(tempbutton)
        tempbutton.constraint(top: view.topAnchor, leading: view.leadingAnchor, padding: UIEdgeInsets(top: 100, left: 100, bottom: 0, right: 0))
        tempbutton.constraint(.widthAnchor, constant: 200)
    }

    @objc
    func buttonDidTap() {
        print("버튼눌림")

        self.makeCustomAlert(lottieName: "mp4TempFile", smallTitle: "gkdll", bigTitle: "gkdl")
    }

}
