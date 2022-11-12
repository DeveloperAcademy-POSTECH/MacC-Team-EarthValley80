//
//  UserDefaultStorage.swift
//  EarthValley80
//
//  Created by SHIN YOON AH on 2022/11/04.
//

import Foundation

enum DataKeys: String, CaseIterable {
    case isSeenGuide
}

struct UserDefaultStorage {
    static var isSeenGuide: Bool {
        return UserData<Bool>.getValue(forKey: .isSeenGuide) ?? false
    }
}

struct UserData<T> {
    static func getValue(forKey key: DataKeys) -> T? {
        if let data = UserDefaults.standard.value(forKey: key.rawValue) as? T {
            return data
        } else {
            return nil
        }
    }
    
    static func setValue(_ value: T, forKey key: DataKeys) {
        UserDefaults.standard.set(value, forKey: key.rawValue)
    }
    
    static func clearAll() {
        DataKeys.allCases.forEach { key in
            UserDefaults.standard.removeObject(forKey: key.rawValue)
        }
    }
    
    static func clear(forKey key: DataKeys) {
        UserDefaults.standard.removeObject(forKey: key.rawValue)
    }
}

