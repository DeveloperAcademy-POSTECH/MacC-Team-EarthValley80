//
//  TabbarButtonView.swift
//  EarthValley80
//
//  Created by seojeon22 on 2022/10/27.
//

import SwiftUI

struct TabBarButton: View {
    var image: String
    var title: String
    @Binding var selectedTab: String
    
    var body: some View {
        Button(action: {
            withAnimation(.easeInOut){ selectedTab = title }
        }, label: {
            if #available(iOS 15.0, *) {
                HStack {
                    Image(systemName: image)
                        .frame(width: 35, height: 35)
                        .foregroundColor(selectedTab == title ? .white : .gray)
                        .padding(EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 0))
                    
                    Text(title)
                        .font(.custom("AppleSDGothicNeo-Medium", size: 16))
                        .fontWeight(.medium)
                        .foregroundColor(selectedTab == title ? .white : .gray)
                    
                    Spacer()
                }
                .frame(width: 214, height: 35 + self.getSafeAreaBottom)
                .background(selectedTab == title ? Color.black : Color.sidemenuColor, in: RoundedRectangle(cornerRadius: 14))
                .shadow(color: selectedTab == title ? Color.black : Color.sidemenuColor, radius: 1, x: 1, y: 1)
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
            } else {
                // TODO: 하위 버전 처리 필요
            }
        })
        .buttonStyle(PlainButtonStyle())
    }
}
