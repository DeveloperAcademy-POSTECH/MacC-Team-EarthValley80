//
//  EconomyArticleProgress.swift
//  EarthValley80
//
//  Created by seojeon22 on 2022/12/07.
//

import SwiftUI

struct EconomyArticleProgress: View {
    @State var pushedStamp: Int = 2

    private var count = 30
    private let pebbleOn = "economyStamp"
    private let pebbleOff = "grayStamp"
    private let badgeOn = "badgeStamp"

    var body: some View {
        VStack(spacing: 22) {
            LazyVStack(spacing: 5) {
                Group {
                    ZStack {
                        Image(count > 0 ? pebbleOn : pebbleOff)
                            .frame(width: 57, height: 57)
                        Image("stamp1")
                            .frame(width: 9, height: 19)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
                    }
                    
                    ZStack {
                        Image(count > 4 ? pebbleOn : pebbleOff)
                            .frame(width: 57, height: 57)
                        Image("stamp5")
                            .frame(width: 9, height: 19)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
                    }
                    .offset(x: 25, y: 0)
                    
                    ZStack {
                        Image(count > 9 ? pebbleOn : pebbleOff)
                            .frame(width: 57, height: 57)
                        Image("stamp10")
                            .frame(width: 9, height: 19)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
                    }
                    .offset(x: 50, y: 0)
                    
                    ZStack {
                        Image(count > 14 ? badgeOn : pebbleOff)
                            .frame(width: 57, height: 57)
                        Image(count > 14 ? "economyLv1" : "grayEconomyLv1")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 41.5, height: 47.5)
                            .scaleEffect(self.pushedStamp == 1 ? 1.25 : 1.0, anchor: .center)
                            .animation(.default)
                            .onTapGesture {
                                self.pushedStamp = 1
                            }
                            .offset(x: 0, y: self.pushedStamp == 1 ? -15 : 0)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 12.5, trailing: 0))
                    }
                    .offset(x: 25, y: 0)
                }
                
                Group {
                    ZStack {
                        Image(count > 19 ? pebbleOn : pebbleOff)
                            .frame(width: 57, height: 57)
                        Image("stamp20")
                            .frame(width: 9, height: 19)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
                    }
                    
                    ZStack {
                        Image(count > 24 ? pebbleOn : pebbleOff)
                            .frame(width: 57, height: 57)
                        
                        Image("stamp25")
                            .frame(width: 9, height: 19)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
                    }
                    .offset(x: -25, y: 0)
                    
                    ZStack {
                        Image(count > 29 ? badgeOn : pebbleOff)
                            .frame(width: 57, height: 57)
                        Image(count > 29 ? "economyLv2" : "grayEconomyLv2")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 41.5, height: 47.5)
                            .scaleEffect(self.pushedStamp == 2 ? 1.25 : 1.0, anchor: .top)
                            .animation(.default)
                            .onTapGesture {
                                self.pushedStamp = 2
                            }
                            .offset(x: 0, y: self.pushedStamp == 2 ? -20 : 0)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 12.5, trailing: 0))
                    }
                    .offset(x: -50, y: 0)
                }
                
                Group {
                    ZStack {
                        Image(count > 34 ? pebbleOn : pebbleOff)
                            .frame(width: 57, height: 57)
                        Image("stamp35")
                            .frame(width: 9, height: 19)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
                    }
                    .offset(x: -65, y: 0)
                    
                    ZStack {
                        Image(count > 39 ? pebbleOn : pebbleOff)
                            .frame(width: 57, height: 57)
                        Image("stamp40")
                            .frame(width: 9, height: 19)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
                    }
                    .offset(x: -50, y: 0)
                    
                    ZStack {
                        Image(count > 44 ? pebbleOn : pebbleOff)
                            .frame(width: 57, height: 57)
                        Image("stamp45")
                            .frame(width: 9, height: 19)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
                    }
                    .offset(x: -25, y: 0)
                    
                    ZStack {
                        Image(count > 49 ? badgeOn : pebbleOff)
                            .frame(width: 57, height: 57)
                        Image(count > 49 ? "economyLv3" : "grayEconomyLv3")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 41.5, height: 47.5)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 12.5, trailing: 0))
                    }
                    .offset(x: 0, y: 0)
                }
            }
        }
    }
}

struct EconomyArticleProgress_Previews: PreviewProvider {
    static var previews: some View {
        EconomyArticleProgress()
    }
}
