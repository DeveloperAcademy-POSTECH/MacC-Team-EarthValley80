//
//  CurrentAffairsProgress.swift
//  EarthValley80
//
//  Created by seojeon22 on 2022/12/07.
//

import SwiftUI

struct CurrentAffairsArticleProgress: View {
    private var count = 2
    private let pebbleOn = "currentAffairsStamp"
    private let pebbleOff = "grayStamp"
    private let badgeOn = "badgeStamp"
    
    var body: some View {
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
                    Image(count > 14 ? "currentAffairsLv1" : "grayCurrentAffairsLv1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 41.5, height: 47.5)
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
                    Image((count > 29 ? "currentAffairsLv2" : "grayCurrentAffairsLv2"))
                        .resizable()
                        .scaledToFit()
                        .frame(width: 41.5, height: 47.5)
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
                        .frame(width: 41.5, height: 47.5)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 12.5, trailing: 0))
                }
                .offset(x: -25, y: 0)
                
                ZStack {
                    Image(count > 49 ? badgeOn : pebbleOff)
                        .frame(width: 57, height: 57)
                    Image((count > 49 ? "currentAffairsLv3" : "grayCurrentAffairsLv3"))
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

struct CurrentAffairsArticleProgress_Previews: PreviewProvider {
    static var previews: some View {
        CurrentAffairsArticleProgress()
    }
}
