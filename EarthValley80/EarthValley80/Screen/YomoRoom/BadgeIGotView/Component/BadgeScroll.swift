//
//  BadgeScroll.swift
//  EarthValley80
//
//  Created by seojeon22 on 2022/12/07.
//

import SwiftUI

struct BadgeScroll: View {
    var body: some View {
        let badgeList = ["economyLv2", "economyLv1", "unlockedTitle", "unlockedTitle", "unlockedTitle", "unlockedTitle", "unlockedTitle", "unlockedTitle", "unlockedTitle", "unlockedTitle", "unlockedTitle", "unlockedTitle"
        ]
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 14) {
                ForEach(0..<badgeList.count) { idx in
                    Image("unlockedTitle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 74, height: 84)
                        .overlay(
                            Image("\(badgeList[idx])")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 74, height: 84)
                        )
                }
            }
        }
    }
}

struct BadgeScroll_Previews: PreviewProvider {
    static var previews: some View {
        BadgeScroll()
    }
}

