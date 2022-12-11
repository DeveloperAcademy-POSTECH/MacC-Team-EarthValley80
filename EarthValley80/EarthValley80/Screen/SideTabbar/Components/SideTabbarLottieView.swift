//
//  SideTabbarLottieView.swift
//  EarthValley80
//
//  Created by seojeon22 on 2022/11/11.
//

import SwiftUI
import UIKit

import Lottie

struct SideTabbarLottieView: UIViewRepresentable {

    // MARK: - property
    var filename: String
    
    // MARK: - func
    func makeUIView(context: UIViewRepresentableContext<SideTabbarLottieView>) -> UIView {
        let view = setupAnimationView()
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<SideTabbarLottieView>) {
        
    }
    
    private func setupAnimationView() -> UIView {
        let view = UIView(frame: .zero)
        let characterImageView = UIImageView(image: ImageLiteral.characterYomo)
        
        characterImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(characterImageView)
        
        NSLayoutConstraint.activate([
            characterImageView.widthAnchor.constraint(equalTo: view.widthAnchor),
            characterImageView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
        
        return view
    }
}
