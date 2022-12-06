//
//  YomoCharacterView.swift
//  EarthValley80
//
//  Created by seojeon22 on 2022/12/07.
//

import SwiftUI

struct YomoCharacterView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .frame(width: 318, height: 522, alignment: .center)
                .foregroundColor(.white)
                .shadow(color: .gray.opacity(0.25), radius: 12, x: 0, y: 5)
                
            VStack(alignment: .center, spacing: 0) {
                HStack {
                    RewardTitle()
                        .padding(EdgeInsets(top: 47, leading: 24, bottom: 30, trailing: 49))
                    FlameStreak()
                        .padding(EdgeInsets(top: 28, leading: 0, bottom: 30, trailing: 30.4))
                }
                YomoCoustume()
                    .padding(EdgeInsets(top: 0, leading: 63, bottom: 44, trailing: 48))
            }
        }
    }
}

struct YomoCharacterView_Previews: PreviewProvider {
    static var previews: some View {
        YomoCharacterView()
    }
}

