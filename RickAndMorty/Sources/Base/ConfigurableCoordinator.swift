//
//  ConfigurableCoordinator.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 04.11.2023.
//

import Foundation

protocol ConfigurableCoordinator: Coordinator {
    associatedtype Configuration
    init(navigationController: NavigationController, configuration: Configuration)
}

extension ConfigurableCoordinator {
    init(navigationController: NavigationController) {
        fatalError("Use init with configuration for this coordinator")
    }
}
