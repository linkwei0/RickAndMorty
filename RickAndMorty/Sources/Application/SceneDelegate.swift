//
//  SceneDelegate.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 04.11.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    private var mainCoordinator: Coordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = scene as? UIWindowScene else { return }
        mainCoordinator = createMainCoordinator(scene: scene)
        mainCoordinator?.start(animated: false)
    }
    
    private func createMainCoordinator(scene: UIWindowScene) -> AppCoordinator {
        let window = UIWindow(windowScene: scene)
        let navController = NavigationController()
        window.rootViewController = navController
        window.backgroundColor = .accentYellow
        window.makeKeyAndVisible()
        
        self.window = window
        
        return AppCoordinator(navigationController: navController)
    }
}
