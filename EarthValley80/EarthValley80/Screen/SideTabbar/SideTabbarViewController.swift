//
//  SideTabbarViewController.swift
//  EarthValley80
//
//  Created by seojeon22 on 2022/10/27.
//

import SwiftUI
import UIKit

class SideTabbarViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBSegueAction func swiftUI(_ coder: NSCoder) -> UIViewController? {
        return UIHostingController(coder: coder, rootView: SideTabbarView())
    }

}
