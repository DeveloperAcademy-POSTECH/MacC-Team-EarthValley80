//
//  SideTabbarView.swift
//  EarthValley80
//
//  Created by seojeon22 on 2022/10/27.
//

import SwiftUI

struct SideTabbarView: View {
    var body: some View {
        SideTabbar()
    }
}

struct SideTabbar: View {
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    @State var selectedTab = "요모조모 뉴스"
    
    var body: some View {
        ZStack(alignment: .leading, content:  {
            TabView(selection: $selectedTab) {
//                Text("요모조모 뉴스")
//                    .tag("요모조모 뉴스")
//                    .ignoresSafeArea(.all, edges: .all)
                
//                Text("뉴스 서랍")
//                    .tag("뉴스 서랍")
//                    .ignoresSafeArea(.all, edges: .all)
//
//                Text("단어장")
//                    .tag("단어장")
//                    .ignoresSafeArea(.all, edges: .all)
            }
            VStack(spacing: 10) {
                InsideTabBarItems(selectedTab: $selectedTab)
                
                Spacer()
            }
            .background(Color.sidemenuColor)
        })
        .ignoresSafeArea(.all, edges: .all)
        .frame(width: nil)
    }
}

struct SideTabbarView_Previews: PreviewProvider {
    static var previews: some View {
        #if DEBUG
        if #available(iOS 15.0, *) {
            SideTabbarView()
                .previewInterfaceOrientation(.landscapeRight)
        } else {
            SideTabbarView()
        }
        #else
        #endif
    }
}
