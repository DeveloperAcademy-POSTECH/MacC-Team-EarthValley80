//
//  SideTabbarLottieView.swift
//  EarthValley80
//
//  Created by seojeon22 on 2022/11/11.
//

import Lottie
import UIKit
import SwiftUI

struct SideTabbarLottieView: UIViewRepresentable {
    
    typealias UIViewType = UIView
    
    var filename: String
    
    func makeUIView(context: UIViewRepresentableContext<SideTabbarLottieView>) -> UIView {
        
        let view = UIView(frame: .zero)
        let animationView = LottieAnimationView()
        animationView.animation = Animation.named(filename)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.play()
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        
        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<SideTabbarLottieView>) {
        
    }
    
}
