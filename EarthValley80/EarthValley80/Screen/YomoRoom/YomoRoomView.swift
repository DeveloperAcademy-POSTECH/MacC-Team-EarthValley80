//
//  YomoRoomView.swift
//  EarthValley80
//
//  Created by seojeon22 on 2022/11/30.
//

import SwiftUI

struct YomoRoomView: View {
    
    var body: some View {
        VStack(spacing: 0) {
            Text("요모의 방")
                .font(.system(size: 15))
                .padding(EdgeInsets(top: 24, leading: 0, bottom: 0, trailing: 0))
            HStack(alignment: .top, spacing: 0) {
                YomoCharacterView()
                    .padding(EdgeInsets(top: 25, leading: 50, bottom: 0, trailing: 0))
                VStack(alignment: .leading) {
                    BadgeIGotView()
                        .padding(EdgeInsets(top: 25, leading: 13, bottom: 60, trailing: 60))
                    ArticleProgressView()
                        .padding(EdgeInsets(top: 0, leading: 25, bottom: 0, trailing: 25))
                }
            }
        }
    }
}

struct YomoRoomView_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 15.0, *) {
            YomoRoomView().previewInterfaceOrientation(.landscapeRight)
        } else {
            // Fallback on earlier versions
        }
    }
}
