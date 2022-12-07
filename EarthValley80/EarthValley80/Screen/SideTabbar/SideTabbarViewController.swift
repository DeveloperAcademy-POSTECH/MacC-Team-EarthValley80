//
//  SideTabbarViewController.swift
//  EarthValley80
//
//  Created by seojeon22 on 2022/10/27.
//

import Combine
import SwiftUI
import UIKit

final class SideTabbarViewController: UIViewController {
    // MARK: - property
    private lazy var notifier = EventManager.shared
    private var sideTabbarView = SideTabbarView()
    private lazy var sideTabbar = UIHostingController(rootView: sideTabbarView)
    private lazy var yomoroom = UIHostingController(rootView: YomoRoomView())
    private var cancellables = Set<AnyCancellable>()
    private let containerViewController = ContainerViewController()
    
    // MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupLayout()
        self.setupNotificationCenter()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: - func
    private func setupLayout() {
        addChild(self.sideTabbar)
        self.view.addSubview(self.sideTabbar.view)
        self.sideTabbar.didMove(toParent: self)
        self.sideTabbar.view.constraint(top: self.view.topAnchor, leading: self.view.leadingAnchor, bottom: self.view.bottomAnchor, trailing: self.view.trailingAnchor)
        
        addChild(self.containerViewController)
        self.view.addSubview(self.containerViewController.view)
        self.containerViewController.didMove(toParent: self)
        self.containerViewController.view.constraint(top: self.view.topAnchor, leading: self.view.leadingAnchor, bottom: self.view.bottomAnchor, trailing: self.view.trailingAnchor, padding: UIEdgeInsets(top: 20, left: 235, bottom: 20, right: 0))
    }

    private func setupNotificationCenter() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.presentNIEGuessingViewController), name: .presentReadingNews, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.presentYomoRoom), name: .presentYomoRoom, object: nil)
    }

    @objc
    private func presentNIEGuessingViewController() {
        let nigGuessingViewController = NieGuessingViewController()

        nigGuessingViewController.modalTransitionStyle = .crossDissolve
        nigGuessingViewController.modalPresentationStyle = .overCurrentContext

        self.present(nigGuessingViewController, animated: true)
    }

    @objc
    private func presentYomoRoom() {
        let vc = yomoroom

        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .overCurrentContext

        self.present(vc, animated: true)
    }
}
