//
//  LocationListCoordinator.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 16.11.2023.
//

import Foundation

class LocationListCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var onDidFinish: (() -> Void)?
    
    let navigationController: NavigationController
    
    required init(navigationController: NavigationController) {
        self.navigationController = navigationController
    }
    
    func start(animated: Bool) {
        showLocationListScreen(animated: animated)
    }
    
    private func showLocationListScreen(animated: Bool) {
        let viewModel = LocationListViewModel(locationService: LocationService())
        let viewController = LocationListViewController(viewModel: viewModel)
        viewController.navigationItem.title = "Локации"
        navigationController.pushViewController(viewController, animated: animated)
    }
}
