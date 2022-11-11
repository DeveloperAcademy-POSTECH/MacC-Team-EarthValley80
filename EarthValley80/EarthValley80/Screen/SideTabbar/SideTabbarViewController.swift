//
//  SideTabbarViewController.swift
//  EarthValley80
//
//  Created by seojeon22 on 2022/10/27.
//

import SwiftUI
import UIKit

class SideTabbarViewController: UIViewController {
    
    private let sideTabbar = UIHostingController(rootView: SideTabbarView())
    private let viewController = YomojomoNewsViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupLayout()
    }
    
    private func setupLayout() {
        addChild(sideTabbar)
        self.view.addSubview(self.sideTabbar.view)
        sideTabbar.didMove(toParent: self)
        self.sideTabbar.view.constraint(top: self.view.topAnchor, leading: self.view.leadingAnchor, bottom: self.view.bottomAnchor, trailing: self.view.trailingAnchor)
        
        addChild(viewController)
        self.view.addSubview(viewController.view)
        viewController.didMove(toParent: self)
        viewController.view.constraint(top: self.view.topAnchor, leading: self.view.leadingAnchor, bottom: self.view.bottomAnchor, trailing: self.view.trailingAnchor, padding: UIEdgeInsets(top: 20, left: 254, bottom: 20, right: 50))
    }
}


