//
//  MenuCoordinator.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 05.11.2023.
//

import Foundation

class MenuCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var onDidFinish: (() -> Void)?
    
    let navigationController: NavigationController

    required init(navigationController: NavigationController) {
        self.navigationController = navigationController
    }
    
    func start(animated: Bool) {
        showMenuScreen(animated: animated)
    }
    
    private func showMenuScreen(animated: Bool) {
        let menuVM = MenuViewModel()
        let menuVC = MenuViewController(viewModel: menuVM)
        menuVC.navigationItem.title = "Меню"
        navigationController.pushViewController(menuVC, animated: animated)
    }
}
