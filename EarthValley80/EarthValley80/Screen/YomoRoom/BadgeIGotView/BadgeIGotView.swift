//
//  BadgeIGotView.swift
//  EarthValley80
//
//  Created by seojeon22 on 2022/12/07.
//

import SwiftUI

struct BadgeIGotView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .frame(maxWidth: .infinity, maxHeight: 170, alignment: .center)
                .foregroundColor(.white)
                .shadow(color: .gray.opacity(0.25), radius: 12, x: 0, y: 5)
            
            VStack(alignment: .leading, spacing: 14) {
                Text("내가 획득한 칭호")
                BadgeScroll()
            }
            .frame(maxWidth: .infinity, maxHeight: 170, alignment: .center)
            .padding(EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 0))
        }
    }
}

struct BadgeIGotView_Previews: PreviewProvider {
    static var previews: some View {
        BadgeIGotView()
    }
}
