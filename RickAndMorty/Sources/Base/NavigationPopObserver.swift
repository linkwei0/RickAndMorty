//
//  NavigationPopObserver.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 04.11.2023.
//

import UIKit

class NavigationPopObserver {
    let observedController: UIViewController
    
    private let coordinator: Coordinator
    
    init(observedController: UIViewController, coordinator: Coordinator) {
        self.observedController = observedController
        self.coordinator = coordinator
    }
    
    func didObservePop() {
        coordinator.onDidFinish?()
    }
}
