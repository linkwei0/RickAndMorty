//
//  EpisodeDetailCoordinator.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 10.11.2023.
//

import Foundation

struct EpisodeDetailCoordinatorConfiguration {
    let episode: EpisodeModel
}

class EpisodeDetailCoordinator: ConfigurableCoordinator {
    typealias Configuration = EpisodeDetailCoordinatorConfiguration
    
    var childCoordinators: [Coordinator] = []
    var onDidFinish: (() -> Void)?
    
    let navigationController: NavigationController
    
    private let configuration: Configuration
    
    required init(navigationController: NavigationController, configuration: EpisodeDetailCoordinatorConfiguration) {
        self.navigationController = navigationController
        self.configuration = configuration
    }
    
    func start(animated: Bool) {
        showEpisodeDetailScreen(animated: animated)
    }
    
    private func showEpisodeDetailScreen(animated: Bool) {
        let viewModel = EpisodeDetailViewModel(characterService: CharacterService(), episode: configuration.episode)
        let viewController = EpisodeDetailViewController(viewModel: viewModel)
        viewController.navigationItem.title = configuration.episode.name
        navigationController.pushViewController(viewController, animated: animated)
    }
}
