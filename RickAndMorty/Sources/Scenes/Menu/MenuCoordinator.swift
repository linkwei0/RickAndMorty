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
        let menuVM: MenuViewModel = DIContainer.shared.resolve()
        menuVM.delegate = self
        let menuVC = MenuViewController(viewModel: menuVM)
        menuVC.navigationItem.title = R.string.menu.menuTitle()
        navigationController.pushViewController(menuVC, animated: animated)
    }
}

// MARK: - MenuViewModelDelegate
extension MenuCoordinator: MenuViewModelDelegate {
    func viewModelDidRequestToShowNextScreen(_ viewModel: MenuViewModel, with type: MenuCellType) {
        switch type {
        case .episodes:
            show(EpisodesCoordinator.self, animated: true)
        case .characters:
            let configuration = EpisodeDetailCoordinatorConfiguration(episode: nil)
            show(EpisodeDetailCoordinator.self, configuration: configuration, animated: true)
//            show(EpisodeDetailCoordinator.self, animated: true)
        case .locations:
            break
        }
    }
}
