//
//  SceneDelegate.swift
//  EarthValley80
//
//  Created by SHIN YOON AH on 2022/10/16.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    // MARK: - property

    lazy var deeplinkCoordinator: DeeplinkCoordinatorProtocol = {
        return DeeplinkCoordinator(handlers: [
            NewsDeeplinkHandler(rootViewController: self.rootViewController)
        ])
    }()

    var rootViewController: UIViewController? {
        return self.window?.rootViewController
    }

    var window: UIWindow?

    // MARK: - func

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(windowScene: windowScene)
        self.window?.backgroundColor = .systemBackground
        self.window?.rootViewController = SideTabbarViewController()
        self.window?.makeKeyAndVisible()
    }

    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        if let url = URLContexts.first?.url {
            let urlStr = url.absoluteString
            let component = urlStr.components(separatedBy: "=")

            if component.count > 1,
               let url = URL(string: component.first ?? ""),
               let newsId = component.last {
                self.deeplinkCoordinator.handleURL(url, newsId: newsId)
            }
        }
    }
    
    func sceneDidDisconnect(_ scene: UIScene) { }
    
    func sceneDidBecomeActive(_ scene: UIScene) { }
    
    func sceneWillResignActive(_ scene: UIScene) { }
    
    func sceneWillEnterForeground(_ scene: UIScene) { }
    
    func sceneDidEnterBackground(_ scene: UIScene) { }
}

// MARK: - View Navigation Helpers
extension SceneDelegate {
    func navigateToNewsFeedViewController() {
        self.window?.rootViewController = SideTabbarViewController()
    }

    func navigateToMyNewsDrawerViewController() {
        let notifier = EventManager.shared
        notifier.sideMenuNumber.send(3)
        self.window?.rootViewController = SideTabbarViewController()
    }
}
