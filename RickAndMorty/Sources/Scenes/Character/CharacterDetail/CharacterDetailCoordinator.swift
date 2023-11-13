//
//  CharacterDetailCoordinator.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 11.11.2023.
//

import Foundation

struct CharacterDetailCoordinatorConfiguration {
    let character: CharacterModel
    let imageData: Data
}

class CharacterDetailCoordinator: ConfigurableCoordinator {
    typealias Configuration = CharacterDetailCoordinatorConfiguration
    
    var childCoordinators: [Coordinator] = []
    var onDidFinish: (() -> Void)?
    
    let navigationController: NavigationController
    
    private let configuration: Configuration
    
    required init(navigationController: NavigationController, configuration: CharacterDetailCoordinatorConfiguration) {
        self.navigationController = navigationController
        self.configuration = configuration
    }
    
    func start(animated: Bool) {
        showCharacterDetailScreen(animated: animated)
    }
    
    private func showCharacterDetailScreen(animated: Bool) {
        let viewModel: CharacterDetailViewModel = DIContainer.shared.resolve(argument1: configuration.character,
                                                                             argument2: configuration.imageData)
        let viewController = CharacterDetailViewController(viewModel: viewModel)
        navigationController.present(viewController, animated: animated)
    }
}
