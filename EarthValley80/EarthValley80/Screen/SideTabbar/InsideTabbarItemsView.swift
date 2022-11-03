//
//  InsideTabbarItemsView.swift
//  EarthValley80
//
//  Created by seojeon22 on 2022/10/27.
//

import SwiftUI

struct InsideTabBarItems: View {
    @Binding var selectedTab: String
    
    var body: some View {
        VStack {
            Image("Logo")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 153, height: 56.97)
                .padding(EdgeInsets(top: 56, leading: 40, bottom: 80, trailing: 40))
            
            VStack(spacing: 0) {
                TabBarButton(image: "newspaper.fill", title: "요모조모 뉴스", selectedTab: $selectedTab)
                Divider().frame(width: 165, height: 1)
                TabBarButton(image: "doc.text.magnifyingglass", title: "뉴스 서랍", selectedTab: $selectedTab)
                Divider().frame(width: 165, height: 1)
                TabBarButton(image: "lasso.and.sparkles", title: "단어장", selectedTab: $selectedTab)
                Divider().frame(width: 165, height: 1)
            }
            Spacer()
            
            Image("Logo_illust")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 147, height: 206)
                .padding(EdgeInsets(top: 150, leading: 40, bottom: 0, trailing: 40))
        }
    }
}
