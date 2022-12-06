//
//  RewardTitle.swift
//  EarthValley80
//
//  Created by seojeon22 on 2022/12/07.
//

import SwiftUI

struct RewardTitle: View {
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            VStack {
                Text("세상에, 당신은")
                    .font(.system(size: 24))
                Text("잠재력왕이군요!")
                    .font(.system(size: 24))
            }
            .frame(width: 160, height: 65, alignment: .center)
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 17, trailing: 0))
            
            if #available(iOS 15.0, *) {
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(.black)
                    .frame(width: 120, height: 22)
                    .overlay {
                        HStack(spacing: 7) {
                            Text("잠재력왕")
                                .font(.system(size: 13))
                            Text("|")
                                .font(.system(size: 13))
                            Text("요모")
                                .font(.system(size: 13))
                        }
                        .foregroundColor(.white)
                    }
            } else {
                // TODO: 15버전 under, Overlay 대체 수단 찾기
            }
        }
    }
}

struct RewardTitle_Previews: PreviewProvider {
    static var previews: some View {
        RewardTitle()
    }
}
