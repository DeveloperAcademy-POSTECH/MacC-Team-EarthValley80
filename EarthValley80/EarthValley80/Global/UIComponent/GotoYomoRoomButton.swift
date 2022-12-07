//
//  GotoYomoRoomButton.swift
//  EarthValley80
//
//  Created by seojeon22 on 2022/11/30.
//

import SwiftUI

struct GotoYomoRoomButton: View {
    @State private var isTapped = false

    let uiFont = UIFont.font(.regular, ofSize: 12)
    
    var body: some View {
        Button {
            withAnimation {
                isTapped.toggle()
            }
        } label: {
            HStack(spacing: 4) {
                Text(StringLiteral.goToYomoRoomText)
                    .font(Font(uiFont))
                    .foregroundColor(.black)
                ImageLiteral.imgGoToYomoRoomArrow
                    .font(.system(size: 12))
                    .foregroundColor(.black)
            }
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
