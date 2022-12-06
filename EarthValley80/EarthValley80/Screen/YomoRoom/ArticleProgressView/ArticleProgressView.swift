//
//  ArticleProgressView.swift
//  EarthValley80
//
//  Created by seojeon22 on 2022/12/07.
//

import SwiftUI

struct ArticleProgressView: View {
    
    var body: some View {
        VStack(spacing: 22) {
            ArticleCategory()
            ScrollView(showsIndicators: false) {
                HStack(spacing: 0) {
                    CurrentAffairsArticleProgress()
                    ScienceArticleProgress()
                    EconomyArticleProgress()
                    CultureArticleProgress()
                }
            }
        }
    }
}

struct ArticleProgressView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleProgressView()
    }
}
