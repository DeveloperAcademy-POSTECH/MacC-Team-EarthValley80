//
//  SideTabbarViewController.swift
//  EarthValley80
//
//  Created by seojeon22 on 2022/10/27.
//

import SwiftUI
import UIKit


final class SideTabbarViewController: UIViewController {
    // MARK: - property
    private let sideTabbar = UIHostingController(rootView: SideTabbarView())
    private let embeddedViewController = YomojomoNewsViewController()
    
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
        
        addChild(self.embeddedViewController)
        self.view.addSubview(self.embeddedViewController.view)
        self.embeddedViewController.didMove(toParent: self)
        self.embeddedViewController.view.constraint(top: self.view.topAnchor, leading: self.view.leadingAnchor, bottom: self.view.bottomAnchor, trailing: self.view.trailingAnchor, padding: UIEdgeInsets(top: 20, left: 254, bottom: 20, right: 50))
    }
}
