//
//  SideTabbarView.swift
//  EarthValley80
//
//  Created by seojeon22 on 2022/10/27.
//

import SwiftUI

struct SideTabbarView: View {
    var body: some View {
        Home()
    }
}

struct SideTabbarView_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 15.0, *) {
            SideTabbarView()
                .previewInterfaceOrientation(.landscapeRight)
        }
    }
}

struct Home: View {
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    @State var selectedTab = "요모조모 뉴스"
    
    var body: some View {
        ZStack(alignment: .leading, content:  {
            TabView(selection: $selectedTab) {
                Text("요모조모 뉴스")
                    .tag("요모조모 뉴스")
                    .ignoresSafeArea(.all, edges: .all)
                
                Text("뉴스 서랍")
                    .tag("뉴스 서랍")
                    .ignoresSafeArea(.all, edges: .all)
                
                Text("단어장")
                    .tag("단어장")
                    .ignoresSafeArea(.all, edges: .all)
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

struct TabBarButton: View {
    var image: String
    var title: String
    @Binding var selectedTab: String
    
    var body: some View {
        Button(action: {
            withAnimation(.easeInOut){selectedTab = title}
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
                .frame(width: 214, height: 35 + self.getSafeAreaBottom())
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

extension View {
    func getScreen()->CGRect {
        return UIScreen.main.bounds
    }
    
    func getSafeAreaBottom()->CGFloat {
        return UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 10
    }
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >>  8) & 0xFF) / 255.0
        let b = Double((rgb >>  0) & 0xFF) / 255.0
        self.init(red: r, green: g, blue: b)
    }
    
    static let sidemenuColor = Color(hex: "#ECECEC")
}

