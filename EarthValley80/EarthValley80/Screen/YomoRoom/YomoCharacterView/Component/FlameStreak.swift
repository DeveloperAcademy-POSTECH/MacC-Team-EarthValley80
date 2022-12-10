//
//  FlameStreak.swift
//  EarthValley80
//
//  Created by seojeon22 on 2022/12/07.
//

import SwiftUI

struct FlameStreak: View {
    @AppStorage("counter") var counter = 0
    @AppStorage("tapDate") var TapDate: String?
    @AppStorage("Tappable") var ButtonTapped = false
    
    var body: some View {
        VStack{
            VStack(spacing: 0) {
                Image("streakOn")
                    .resizable()
                    .frame(width: 73.6, height: 73.6)
                    .scaledToFit()
                Text("\(counter)").foregroundColor(.black)
                    .font(.system(size: 18, weight: .bold))
                VStack(alignment: .center, spacing: 0) {
                    Text("불꽃")
                        .font(.system(size: 10))
                    Text("연속일")
                        .font(.system(size: 10))
                }
                .padding(EdgeInsets(top: 6.36, leading: 0, bottom: 0, trailing: 0))
            }
        }
        .frame(width: 73.6, height: 123.11, alignment: .center)
        .onAppear {
            if ("\(Date.getTodayDate())") == TapDate ||
                "(Date.getTomorrowDate())" == TapDate {
                self.ButtonTapped = true
            }
            else {
                self.TapDate = nil
                self.ButtonTapped = false
                self.counter = 0
            }
        }
    }
}

struct FlameStreak_Previews: PreviewProvider {
    static var previews: some View {
        FlameStreak()
    }
}
