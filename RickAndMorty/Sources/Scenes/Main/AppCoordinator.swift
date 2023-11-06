//
//  MainCoordinator.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 04.11.2023.
//

import UIKit

class AppCoordinator: Coordinator {
    // MARK: - Properties
    var childCoordinators: [Coordinator] = []
    var onDidFinish: (() -> Void)?
    
    let navigationController: NavigationController
    
    private var userInSystem: DataStoreProtocol = DIContainer.shared.resolve()

    // MARK: - Init
    required init(navigationController: NavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Start
    func start(animated: Bool) {
        if userInSystem.welcomeInfo {
            showMenuScreen(animated: animated)
        } else {
            showWelcomeScreen(animated: animated)
        }
    }
    
    private func showMenuScreen(animated: Bool) {
        show(MenuCoordinator.self, animated: animated)
    }
    
    private func showWelcomeScreen(animated: Bool) {
        let coordinator = show(WelcomeCoordinator.self, animated: animated)
        coordinator.delegate = self
    }
    
    // MARK: - Private methods
    private func resetCoordinators() {
        navigationController.dismiss(animated: false)
        navigationController.setViewControllers([], animated: false)
        navigationController.removeAllPopObservers()
        childCoordinators.removeAll()
        
        if let window = UIApplication.shared.connectedScenes
            .filter({ $0.activationState == .foregroundActive })
            .map({ $0 as? UIWindowScene })
            .compactMap({ $0 })
            .first?.windows
            .first(where: { $0.isKeyWindow }) {
            changeRootViewController(of: window, to: navigationController)
        }
        start(animated: false)
    }
    
    private func changeRootViewController(of window: UIWindow, to viewController: UIViewController,
                                          animationDuration: TimeInterval = 0.6) {
        let animations = {
            UIView.performWithoutAnimation {
                window.rootViewController = self.navigationController
            }
        }
        UIView.transition(with: window, duration: animationDuration, options: .transitionFlipFromRight, animations: animations)
    }
}

// MARK: - WelcomeCoordinatorDelegate
extension AppCoordinator: WelcomeCoordinatorDelegate {
    func welcomeCoordinatorDidFinish(_ coordinator: WelcomeCoordinator) {
        userInSystem.welcomeInfo = true
        resetCoordinators()
    }
}
