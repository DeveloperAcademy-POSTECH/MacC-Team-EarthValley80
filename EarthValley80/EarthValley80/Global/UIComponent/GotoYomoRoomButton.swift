//
//  GotoYomoRoomButton.swift
//  EarthValley80
//
//  Created by seojeon22 on 2022/11/30.
//

import SwiftUI

struct GotoYomoRoomButton: View {
    @State private var isTapped = false
    
    var body: some View {
        Button {
            withAnimation {
                isTapped.toggle()
            }
        } label: {
            HStack(spacing: 8) {
                Text(StringLiteral.goToYomoRoomText)
                    .font(.system(size: 12))
                    .foregroundColor(.black)
                ImageLiteral.imgGoToYomoRoomArrow
                    .font(.system(size: 12))
                    .foregroundColor(.black)
            }
            .frame(width: 90, height: 14)
        }
        
        if isTapped {
            YomoRoomView()
                .transition(.move(edge: .leading))
        }
    }
}

struct GotoYomoRoomButton_Previews: PreviewProvider {
    static var previews: some View {
        GotoYomoRoomButton()
    }
}
