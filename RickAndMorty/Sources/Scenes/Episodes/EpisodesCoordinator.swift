//
//  EpisodesCoordinator.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 06.11.2023.
//

import Foundation

class EpisodesCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var onDidFinish: (() -> Void)?
    
    let navigationController: NavigationController

    required init(navigationController: NavigationController) {
        self.navigationController = navigationController
    }
    
    func start(animated: Bool) {
        showEpisodesScreen(animated: animated)
    }
    
    private func showEpisodesScreen(animated: Bool) {
        let viewModel: EpisodesViewModel = DIContainer.shared.resolve()
        viewModel.delegate = self
        let viewController = EpisodesViewController(viewModel: viewModel)
        viewController.navigationItem.title = R.string.episodes.episodesTitle()
        navigationController.pushViewController(viewController, animated: animated)
    }
}

// MARK: - EpisodesViewModelDelegate
extension EpisodesCoordinator: EpisodesViewModelDelegate {
    func viewModelDidRequestToShowEpisodeDetail(_ viewModel: EpisodesViewModel, episode: EpisodeModel) {
        let configuration = EpisodeDetailCoordinatorConfiguration(episode: episode)
        show(EpisodeDetailCoordinator.self, configuration: configuration, animated: true)
    }
}
