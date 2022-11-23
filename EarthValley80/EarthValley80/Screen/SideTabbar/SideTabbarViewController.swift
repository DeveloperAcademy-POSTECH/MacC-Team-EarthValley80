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
        self.containerViewController.view.constraint(top: self.view.topAnchor, leading: self.view.leadingAnchor, bottom: self.view.bottomAnchor, trailing: self.view.trailingAnchor, padding: UIEdgeInsets(top: 20, left: 254, bottom: 20, right: 50))
    }

    private func setupNotificationCenter() {
        NotificationCenter.default.addObserver(self, selector: #selector(presentReadingNewsViewController), name: .presentReadingNews, object: nil)
    }

    @objc
    private func presentReadingNewsViewController() {
        let storyboard = UIStoryboard(name: "News", bundle: nil)
        guard let newsViewController = storyboard.instantiateViewController(withIdentifier: ReadingNewsViewController.className) as? ReadingNewsViewController else { return }

        newsViewController.modalTransitionStyle = .crossDissolve
        newsViewController.modalPresentationStyle = .fullScreen

        self.present(newsViewController, animated: true)
    }
}
