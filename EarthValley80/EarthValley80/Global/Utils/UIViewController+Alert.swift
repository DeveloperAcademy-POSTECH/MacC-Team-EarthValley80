//
//  UIViewController+Alert.swift
//  EarthValley80
//
//  Created by SHIN YOON AH on 2022/10/17.
//

import UIKit

extension UIViewController {
    func makeAlert(title: String,
                   message: String? = nil,
                   okAction: ((UIAlertAction) -> Void)? = nil,
                   completion : (() -> Void)? = nil) {
        let alertViewController = UIAlertController(title: title,
                                                    message: message,
                                                    preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: okAction)
        alertViewController.addAction(okAction)
        
        self.present(alertViewController, animated: true, completion: completion)
    }
    
    func makeRequestAlert(title: String,
                          message: String,
                          okTitle: String = "확인",
                          cancelTitle: String = "취소",
                          okAction: ((UIAlertAction) -> Void)?,
                          cancelAction: ((UIAlertAction) -> Void)? = nil,
                          completion : (() -> Void)? = nil) {
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
        
        let alertViewController = UIAlertController(title: title, message: message,
                                                    preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: cancelTitle, style: .default, handler: cancelAction)
        alertViewController.addAction(cancelAction)
        
        let okAction = UIAlertAction(title: okTitle, style: .destructive, handler: okAction)
        alertViewController.addAction(okAction)
        
        self.present(alertViewController, animated: true, completion: completion)
    }
    
    func makeActionSheet(title: String? = nil,
                         message: String? = nil,
                         actionTitles:[String?],
                         actionStyle:[UIAlertAction.Style],
                         actions:[((UIAlertAction) -> Void)?]) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        
        for (index, title) in actionTitles.enumerated() {
            let action = UIAlertAction(title: title, style: actionStyle[index], handler: actions[index])
            alert.addAction(action)
        }
        
        self.present(alert, animated: true, completion: nil)
    }

    func makeCustomAlert(lottieName: String,
                          smallTitle: String,
                          bigTitle: String,
                          leftTitle: String = "취소",
                          rightTitle: String = "확인",
                          leftAction: (() -> Void)? = nil,
                          rightAction: (() -> Void)? = nil) {
        let alertViewController = AlertViewController(lottieName: lottieName,
                                                      smallTitle: smallTitle,
                                                      bigTitle: rightTitle)
        self.makeAlert(alertViewController: alertViewController,
                       leftTitle: leftTitle,
                       rightTitle: rightTitle,
                       leftAction: leftAction,
                       rightAction: rightAction)
    }

    private func makeAlert(alertViewController: AlertViewController,
                           leftTitle: String,
                           rightTitle: String,
                           leftAction: (() -> Void)?,
                           rightAction: (() -> Void)?) {
        alertViewController.addActionToButton(title: leftTitle,
                                              titleColor: .evyBlack2,
                                              backgroundColor: .red) {
            alertViewController.dismiss(animated: false, completion: leftAction)
        }

        alertViewController.addActionToButton(title: rightTitle,
                                              titleColor: .evyBlack2,
                                              backgroundColor: .red) {
            alertViewController.dismiss(animated: false, completion: rightAction)
        }
        present(alertViewController, animated: false, completion: nil)
    }
}
