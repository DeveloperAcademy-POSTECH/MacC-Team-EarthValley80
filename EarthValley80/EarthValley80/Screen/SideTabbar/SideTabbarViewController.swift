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
    lazy var sideTabbarView: SideTabbarView = {
        let notifierValue = SideTabbarView()
        return notifierValue
    }()
    private lazy var sideTabbar = UIHostingController(rootView: sideTabbarView)
    private let embeddedYomoJomoNewsViewController = YomojomoNewsViewController()
    private let embeddedMyNewsDrawerViewController = MyNewsDrawerViewController()
    private var cancellables = Set<AnyCancellable>()
    private let changeVC = ContainerViewController()
    
    // MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupLayout()
    }
    
    // MARK: - func
    private func setupLayout() {
        addChild(self.sideTabbar)
        self.view.addSubview(self.sideTabbar.view)
        self.sideTabbar.didMove(toParent: self)
        self.sideTabbar.view.constraint(top: self.view.topAnchor, leading: self.view.leadingAnchor, bottom: self.view.bottomAnchor, trailing: self.view.trailingAnchor)
        
        addChild(self.changeVC)
        self.view.addSubview(self.changeVC.view)
        self.changeVC.didMove(toParent: self)
        self.changeVC.view.constraint(top: self.view.topAnchor, leading: self.view.leadingAnchor, bottom: self.view.bottomAnchor, trailing: self.view.trailingAnchor, padding: UIEdgeInsets(top: 20, left: 254, bottom: 20, right: 50))
    }
}
