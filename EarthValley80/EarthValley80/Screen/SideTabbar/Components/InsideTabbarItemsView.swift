//
//  InsideTabbarItemsView.swift
//  EarthValley80
//
//  Created by seojeon22 on 2022/10/27.
//

import SwiftUI

struct InsideTabBarItems: View {
    @Binding var selectedTab: String
    private let notifier = EventManager.shared

    let uiFont = UIFont.font(.regular, ofSize: 12)

    var body: some View {
        VStack {
            ImageLiteral.imgYomoJomoLogo
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 94, height: 36)
                .padding(EdgeInsets(top: 60, leading: 72, bottom: 58, trailing: 67))
                .background(Color.white)
            ZStack {
                SideTabbarLottieView(filename: StringLiteral.yomoProfileLottieFile)
                    .frame(width: 132, height: 143)
                Text(StringLiteral.yomoProfileTitle)
                    .font(Font(uiFont))
                    .foregroundColor(.gray)
                    .padding(EdgeInsets(top: 30, leading: 0, bottom: 230, trailing: 0))
                GotoYomoRoomButton()
                    .padding(EdgeInsets(top: 200, leading: 90, bottom: 0, trailing: 0))
            }
            .padding(.bottom)
            VStack(spacing: 0) {
                TabBarButton(selectedTab: $selectedTab, image: ImageLiteral.imgSideMenu1, title: StringLiteral.sideTapButton1)
                Divider().frame(width: 165, height: 1)
                TabBarButton(selectedTab: $selectedTab, image: ImageLiteral.imgSideMenu2, title: StringLiteral.sideTapButton2)
                Divider().frame(width: 165, height: 1)
                TabBarButton(selectedTab: $selectedTab, image: ImageLiteral.imgSideMenu3, title: StringLiteral.sideTapButton3)
                Divider().frame(width: 165, height: 1)
            }
            Spacer()
        }
    }
}
