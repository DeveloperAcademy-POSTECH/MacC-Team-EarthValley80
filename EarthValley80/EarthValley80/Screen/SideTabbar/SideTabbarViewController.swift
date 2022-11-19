//
//  SideTabbarViewController.swift
//  EarthValley80
//
//  Created by seojeon22 on 2022/10/27.
//

import Combine
import SwiftUI
import UIKit

class ChangeViewController: UIViewController {
    // MARK: - property
    let embeddedYomoJomoNewsViewController = YomojomoNewsViewController()
    let embeddedMyNewsDrawerViewController = MyNewsDrawerViewController()
    private lazy var notifier = EventMessenger.shared
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - life cycle
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    override func viewDidLoad() {
        view.addSubview(embeddedYomoJomoNewsViewController.view)
        view.addSubview(embeddedMyNewsDrawerViewController.view)
        
        notifier
            .sideMenuNumber
            .sink { [weak self] currentIndex in
                switch currentIndex {
                case 1:
                    self?.embeddedYomoJomoNewsViewController.view.isHidden = false
                    self?.embeddedMyNewsDrawerViewController.view.isHidden = true
                case 2:
                    self?.embeddedYomoJomoNewsViewController.view.isHidden = true
                    self?.embeddedMyNewsDrawerViewController.view.isHidden = true
                case 3:
                    self?.embeddedYomoJomoNewsViewController.view.isHidden = true
                    self?.embeddedMyNewsDrawerViewController.view.isHidden = false
                default: break
                }
            }
            .store(in: &cancellables)
    }
}

final class SideTabbarViewController: UIViewController {
    // MARK: - property
    private lazy var notifier = EventMessenger.shared
    lazy var sideTabbarView: SideTabbarView = {
        let notifierValue = SideTabbarView()
        return notifierValue
    }()
    private lazy var sideTabbar = UIHostingController(rootView: sideTabbarView)
    private let embeddedYomoJomoNewsViewController = YomojomoNewsViewController()
    private let embeddedMyNewsDrawerViewController = MyNewsDrawerViewController()
    private var cancellables = Set<AnyCancellable>()
    private let changeVC = ChangeViewController()
    
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
        
        addChild(changeVC)
        self.view.addSubview(self.changeVC.view)
        self.changeVC.didMove(toParent: self)
        self.changeVC.view.constraint(top: self.view.topAnchor, leading: self.view.leadingAnchor, bottom: self.view.bottomAnchor, trailing: self.view.trailingAnchor, padding: UIEdgeInsets(top: 20, left: 254, bottom: 20, right: 50))
    }
}
