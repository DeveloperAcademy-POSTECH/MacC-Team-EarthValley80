//
//  YomoCostume.swift
//  EarthValley80
//
//  Created by seojeon22 on 2022/12/07.
//

import SwiftUI

struct YomoCoustume: View {
    @Binding var pushedStamp: Int

    var body: some View {
        if pushedStamp == 1 {
            Image("economyLv1Yomo")
                .resizable()
                .scaledToFit()
                .frame(width: 207, height: 297, alignment: .center)
        } else if pushedStamp == 2 {
            Image("economyLv2Yomo")
                .resizable()
                .scaledToFit()
                .frame(width: 207, height: 297, alignment: .center)
        }
    }
}

struct YomoCoustume_Previews: PreviewProvider {
    static var previews: some View {
        YomoCoustume(pushedStamp: .constant(2))
    }
}
