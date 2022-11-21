//
//  SideTabbarEventMessenger.swift
//  EarthValley80
//
//  Created by seojeon22 on 2022/11/18.
//

import Combine

final class EventMessenger: ObservableObject {
    // MARK: - property
    static let shared = EventMessenger()
    let sideMenuNumber: CurrentValueSubject<Int, Never> = .init(1)
    
    private init() {}
}
