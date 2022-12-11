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

    private let sideTabbar = UIHostingController(rootView: SideTabbarView())
    private let containerViewController = ContainerViewController()

    private lazy var notifier = EventManager.shared
    private var cancellables = Set<AnyCancellable>()
    
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
        self.addChild(self.sideTabbar)
        self.view.addSubview(self.sideTabbar.view)
        self.sideTabbar.didMove(toParent: self)
        self.sideTabbar.view.constraint(top: self.view.topAnchor,
                                        leading: self.view.leadingAnchor,
                                        bottom: self.view.bottomAnchor,
                                        trailing: self.view.trailingAnchor)
        
        self.addChild(self.containerViewController)
        self.view.addSubview(self.containerViewController.view)
        self.containerViewController.didMove(toParent: self)
        self.containerViewController.view.constraint(top: self.view.topAnchor,
                                                     leading: self.view.leadingAnchor,
                                                     bottom: self.view.bottomAnchor,
                                                     trailing: self.view.trailingAnchor,
                                                     padding: UIEdgeInsets(top: 20, left: 235, bottom: 20, right: 0))
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
        let hostingController = UIHostingController(rootView: YomoRoomView(pushedStamp: .constant(1)))
        hostingController.modalTransitionStyle = .crossDissolve
        hostingController.modalPresentationStyle = .overCurrentContext
        self.present(hostingController, animated: true)
    }
}
