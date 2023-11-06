//
//  NavigationController.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 04.11.2023.
//

import UIKit

class NavigationController: UINavigationController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
    
    private var popObservers: [NavigationPopObserver] = []
    
    init() {
        super.init(nibName: nil, bundle: nil)
        setupNavigationBarAppearance()
        delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupNavigationBarAppearance()
    }
    
    private func setupNavigationBarAppearance() {
        let titleAttributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.baseBlack,
                                                              .font: UIFont.boldSystemFont(ofSize: 16)]

        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .accentYellow
        appearance.shadowColor = .clear
        appearance.shadowImage = UIImage()
        appearance.titleTextAttributes = titleAttributes
        navigationBar.standardAppearance = appearance
        navigationBar.scrollEdgeAppearance = appearance

        navigationBar.barTintColor = .accentYellow
        navigationBar.isTranslucent = false
        navigationBar.tintColor = .baseBlack
        navigationBar.titleTextAttributes = titleAttributes
        navigationBar.shadowImage = UIImage()
    }
    
    func addPopObserver(for viewController: UIViewController, coordinator: Coordinator) {
        let obervser = NavigationPopObserver(observedController: viewController, coordinator: coordinator)
        popObservers.append(obervser)
    }
    
    func removeAllPopObservers() {
        popObservers.removeAll()
    }
}

extension NavigationController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController,
                              didShow viewController: UIViewController, animated: Bool) {
        popObservers.forEach { observer in
            if !navigationController.viewControllers.contains(observer.observedController) {
                observer.didObservePop()
                popObservers.removeAll { $0 === observer }
            }
        }
    }
}
