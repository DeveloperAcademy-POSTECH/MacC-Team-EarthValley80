//
//  YomoCostume.swift
//  EarthValley80
//
//  Created by seojeon22 on 2022/12/07.
//

import SwiftUI

struct YomoCoustume: View {
    var body: some View {
        Image("normalYomo")
            .resizable()
            .scaledToFit()
            .frame(width: 207, height: 297, alignment: .center)
    }
}

struct YomoCoustume_Previews: PreviewProvider {
    static var previews: some View {
        YomoCoustume()
    }
}
