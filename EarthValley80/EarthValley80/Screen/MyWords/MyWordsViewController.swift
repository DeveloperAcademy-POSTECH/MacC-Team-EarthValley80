//
//  MyWordsViewController.swift
//  EarthValley80
//
//  Created by seojeon22 on 2022/11/03.
//

import UIKit
import Lottie
import SwiftUI

class MyWordsViewController: UIViewController {

    private let myWordsMainTitle: MainTitleView = {
            let titleView = MainTitleView()
            titleView.changeLabelText(date: Date().dateFormatted("EEEE, MM d"),
                                      title: StringLiteral.myWordsTitle,
                                      description: StringLiteral.myWordsGreetingComments)
            return titleView
        }()
    
        private let myWordsEmptyView = GotoYomojomoNewsEmptyView()

        override func viewDidLoad() {
            super.viewDidLoad()
            self.setupLayout()
    }
    
    private func setupLayout() {
        
        self.view.addSubview(self.myWordsMainTitle)
                self.myWordsMainTitle.constraint(top: self.view.safeAreaLayoutGuide.topAnchor,
                                             leading: self.view.leadingAnchor,
                                             trailing: self.view.trailingAnchor,
                                                 padding: UIEdgeInsets(top: 30, left: 0, bottom: 669, right: 0))
        self.myWordsEmptyView.changeLabelText(greetingComments: StringLiteral.myWordsGreetingComments,
                                 lottieImageTitle: "mp4TempFile",
                                 buttonImage: ImageLiteral.icoNews,
                                 buttonTitle: "요모조모 뉴스 보러가기")
        view.addSubview(myWordsEmptyView)
        self.myWordsEmptyView.constraint(top: view.topAnchor,
                            leading: view.leadingAnchor,
                            trailing: view.trailingAnchor,
                            padding: UIEdgeInsets(top: 230, left: 291, bottom: 210, right: 292))
    }
    
}

struct MainViewController_Previews: PreviewProvider {
  static var previews: some View {
      if #available(iOS 15.0, *) {
          Container().edgesIgnoringSafeArea(.all).previewInterfaceOrientation(.landscapeRight)
      } else {
          
      }
  }
  
  struct Container: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
      let rootViewController = MyWordsViewController()
      return UINavigationController(rootViewController: rootViewController)
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
    typealias UIViewControllerType = UIViewController
  }
}
