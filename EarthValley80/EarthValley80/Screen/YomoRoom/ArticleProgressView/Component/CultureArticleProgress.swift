//
//  CultureArticleProgress.swift
//  EarthValley80
//
//  Created by seojeon22 on 2022/12/07.
//

import SwiftUI

struct CultureArticleProgress: View {
    var count = 0
    private let pebbleOn = "sciencePebble"
    private let pebbleOff = "grayPebble"
    
    var body: some View {
        VStack(spacing: 22) {
           
            LazyVStack(spacing: 5) {
                ZStack {
                    Image(pebbleOff)
                        .frame(width: 57, height: 57)
                    Image("pebble1")
                        .frame(width: 9, height: 19)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
                }
                
                ZStack {
                    Image(pebbleOff)
                        .frame(width: 57, height: 57)
                    Image("pebble5")
                        .frame(width: 9, height: 19)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
                }
                .offset(x: 25, y: 0)
                
                ZStack {
                    Image(pebbleOff)
                        .frame(width: 57, height: 57)
                    Image("pebble10")
                        .frame(width: 9, height: 19)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
                }
                .offset(x: 50, y: 0)
                
                ZStack {
                    Image(pebbleOff)
                        .frame(width: 57, height: 57)
                    Image("grayCurrentAffairsLv2Badge")
                        .frame(width: 41.5, height: 47.5)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 12.5, trailing: 0))
                }
                .offset(x: 25, y: 0)
                
                ZStack {
                    Image(pebbleOff)
                        .frame(width: 57, height: 57)
                    Image("pebble20")
                        .frame(width: 9, height: 19)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
                }
                
                ZStack {
                    Image(pebbleOff)
                        .frame(width: 57, height: 57)
                    Image("pebble25")
                        .frame(width: 9, height: 19)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
                }
                .offset(x: -25, y: 0)
                
                ZStack {
                    Image(pebbleOff)
                        .frame(width: 57, height: 57)
                    Image("grayCurrentAffairsLv2Badge")
                        .frame(width: 41.5, height: 47.5)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 12.5, trailing: 0))
                }
                .offset(x: -50, y: 0)
                
                ZStack {
                    Image(pebbleOff)
                        .frame(width: 57, height: 57)
                    Image("pebble35")
                        .frame(width: 9, height: 19)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
                }
                .offset(x: -65, y: 0)
                
                ZStack {
                    Image(pebbleOff)
                        .frame(width: 57, height: 57)
                    Image("pebble35")
                        .frame(width: 9, height: 19)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
                }
                .offset(x: -65, y: 0)
                
                ZStack {
                    Image(pebbleOff)
                        .frame(width: 57, height: 57)
                    Image("grayCurrentAffairsLv2Badge")
                        .frame(width: 41.5, height: 47.5)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 12.5, trailing: 0))
                }
                .offset(x: -50, y: 0)
            }
        }
    }
}

struct CultureArticleProcess_Previews: PreviewProvider {
    static var previews: some View {
        CultureArticleProgress()
    }
}
