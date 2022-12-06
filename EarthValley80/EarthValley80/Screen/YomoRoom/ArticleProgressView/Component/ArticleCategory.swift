//
//  ArticleCategory.swift
//  EarthValley80
//
//  Created by seojeon22 on 2022/12/07.
//

import SwiftUI

struct ArticleCategory: View {
    var body: some View {
        HStack {
            ZStack {
                Capsule()
                    .stroke()
                    .frame(width: 84, height: 34)
                    .foregroundColor(.gray.opacity(0.75))
                
                HStack(spacing: 4) {
                    Image("currentAffairs")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 16.08, height: 15.75)
                    Text("시사")
                        .font(.system(size: 14))
                }
            }
            
            Spacer()
            
            ZStack {
                Capsule()
                    .stroke()
                    .frame(width: 84, height: 34)
                    .foregroundColor(.gray.opacity(0.75))
                
                HStack(spacing: 4) {
                    Image("science")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 16.08, height: 15.75)
                    Text("과학")
                        .font(.system(size: 14))
                }
            }
            
            Spacer()
            
            ZStack {
                Capsule()
                    .stroke()
                    .frame(width: 84, height: 34)
                    .foregroundColor(.gray.opacity(0.75))
                
                HStack(spacing: 4) {
                    Image("economy")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 16.08, height: 15.75)
                    Text("경제")
                        .font(.system(size: 14))
                }
            }
            
            Spacer()
            
            ZStack {
                Capsule()
                    .stroke()
                    .frame(width: 84, height: 34)
                    .foregroundColor(.gray.opacity(0.75))
                
                HStack(spacing: 4) {
                    Image("culture")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 16.08, height: 15.75)
                    Text("문화")
                        .font(.system(size: 14))
                }
            }
        }
        .padding(EdgeInsets(top: 0, leading: 60, bottom: 0, trailing: 60))
    }
}

struct ArticleCategory_Previews: PreviewProvider {
    static var previews: some View {
        ArticleCategory()
    }
}
