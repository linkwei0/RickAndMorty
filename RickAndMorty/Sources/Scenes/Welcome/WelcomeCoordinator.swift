//
//  WelcomeCoordinator.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 05.11.2023.
//

import Foundation

protocol WelcomeCoordinatorDelegate: AnyObject {
    func welcomeCoordinatorDidFinish(_ coordinator: WelcomeCoordinator)
}

class WelcomeCoordinator: Coordinator {
    weak var delegate: WelcomeCoordinatorDelegate?
    
    var childCoordinators: [Coordinator] = []
    var onDidFinish: (() -> Void)?
    
    let navigationController: NavigationController

    required init(navigationController: NavigationController) {
        self.navigationController = navigationController
    }
        
    func start(animated: Bool) {
        showWelcomeScreen(animated: animated)
    }
    
    private func showWelcomeScreen(animated: Bool) {
        let welcomeVM = WelcomeViewModel()
        welcomeVM.delegate = self
        let welcomeVC = WelcomeViewController(viewModel: welcomeVM)
        welcomeVC.navigationItem.title = R.string.welcome.welcomeTitle()
        navigationController.pushViewController(welcomeVC, animated: animated)
    }
}

// MARK: - WelcomeViewModelDelegate
extension WelcomeCoordinator: WelcomeViewModelDelegate {
    func viewModelDidRequestToShowMenuScreen(_ viewModel: WelcomeViewModel) {
        delegate?.welcomeCoordinatorDidFinish(self)
    }
}
