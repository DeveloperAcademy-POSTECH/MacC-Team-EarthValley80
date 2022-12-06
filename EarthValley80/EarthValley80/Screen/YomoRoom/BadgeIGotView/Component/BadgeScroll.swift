//
//  BadgeScroll.swift
//  EarthValley80
//
//  Created by seojeon22 on 2022/12/07.
//

import SwiftUI

struct BadgeScroll: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 14) {
                ForEach(1..<15) {
                    Image("unlockedTitle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 74, height: 84)
                        .overlay(
                            Image("economyLv" + "\($0)" + "Title")
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

