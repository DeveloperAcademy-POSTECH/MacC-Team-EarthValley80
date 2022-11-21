//
//  InsideTabbarItemsView.swift
//  EarthValley80
//
//  Created by seojeon22 on 2022/10/27.
//

import SwiftUI

struct InsideTabBarItems: View {
    @Binding var selectedTab: String
    private let notifier = EventMessenger.shared
    
    var body: some View {
        VStack {
            Image("yomojomoLogo")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 94, height: 36)
                .padding(EdgeInsets(top: 60, leading: 72, bottom: 58, trailing: 67))
                .background(Color.white)
            ZStack {
                SideTabbarLottieView(filename: StringLiteral.yomoProfileLottieFile)
                    .frame(width: 200, height: 250)
                Text(StringLiteral.yomoProfileTitle)
                    .font(.system(size: 10))
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 120, trailing: 0))
                HStack(spacing: 0) {
                    Text(StringLiteral.goToYomoRoomText)
                        .font(.system(size: 10))
                    Image(systemName: "arrowtriangle.right.fill")
                        .font(.system(size: 10))
                }
                .padding(EdgeInsets(top: 120, leading: 100, bottom: 0, trailing: 0))
            }
            .padding(.bottom)
            VStack(spacing: 0) {
                TabBarButton(selectedTab: $selectedTab, image: "newspaper.fill", title: StringLiteral.sideTapButton1)
                Divider().frame(width: 165, height: 1)
                TabBarButton(selectedTab: $selectedTab, image: "lasso.and.sparkles", title: StringLiteral.sideTapButton2)
                Divider().frame(width: 165, height: 1)
                TabBarButton(selectedTab: $selectedTab, image: "doc.text.magnifyingglass", title: StringLiteral.sideTapButton3)
                Divider().frame(width: 165, height: 1)
            }
            Spacer()
        }
    }
}
