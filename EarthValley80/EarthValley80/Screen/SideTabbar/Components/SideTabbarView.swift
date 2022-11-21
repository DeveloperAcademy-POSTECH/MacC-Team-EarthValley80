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
    @State var selectedTab = StringLiteral.sideTapButton1
    
    var body: some View {
        ZStack(alignment: .leading, content: {
            HStack {
                VStack(spacing: 10) {
                    InsideTabBarItems(selectedTab: $selectedTab)
                    Spacer()
                }
                .background(Color.sidemenuColor)
                Spacer()
            }
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
