//
//  ContainerViewController.swift
//  EarthValley80
//
//  Created by seojeon22 on 2022/11/22.
//

import Combine
import UIKit

final class ContainerViewController: UIViewController {
    // MARK: - property
    private let embeddedYomoJomoNewsViewController = YomojomoNewsViewController()
    private let embeddedMyNewsDrawerViewController = MyNewsDrawerViewController()
    private lazy var notifier = EventManager.shared
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - life cycle
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    override func viewDidLoad() {
        self.setupLayout()
        self.setupNotifier()
    }
    
    //MARK: - func
    private func setupLayout() {
        self.view.addSubview(self.embeddedYomoJomoNewsViewController.view)
        self.view.addSubview(self.embeddedMyNewsDrawerViewController.view)
    }
    
    private func setupNotifier() {
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
