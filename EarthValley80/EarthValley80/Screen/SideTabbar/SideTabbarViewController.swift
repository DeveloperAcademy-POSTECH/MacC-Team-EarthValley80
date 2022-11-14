//
//  SideTabbarViewController.swift
//  EarthValley80
//
//  Created by seojeon22 on 2022/10/27.
//

import SwiftUI
import UIKit

final class SideTabbarViewController: UIViewController {
    
    private let sideTabbar = UIHostingController(rootView: SideTabbarView())
    private let embeddedViewController = YomojomoNewsViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupLayout()
    }
    
    private func setupLayout() {
        addChild(sideTabbar)
        self.view.addSubview(self.sideTabbar.view)
        sideTabbar.didMove(toParent: self)
        self.sideTabbar.view.constraint(top: self.view.topAnchor, leading: self.view.leadingAnchor, bottom: self.view.bottomAnchor, trailing: self.view.trailingAnchor)
        
        addChild(embeddedViewController)
        self.view.addSubview(embeddedViewController.view)
        embeddedViewController.didMove(toParent: self)
        embeddedViewController.view.constraint(top: self.view.topAnchor, leading: self.view.leadingAnchor, bottom: self.view.bottomAnchor, trailing: self.view.trailingAnchor, padding: UIEdgeInsets(top: 20, left: 254, bottom: 20, right: 50))
    }
}


