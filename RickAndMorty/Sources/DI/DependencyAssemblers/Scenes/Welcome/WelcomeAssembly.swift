//
//  WelcomeAssembly.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 06.11.2023.
//

import Foundation
import Swinject

final class WelcomeAssembly: Assembly {
    func assemble(container: Container) {
        container.register(WelcomeViewModel.self) { _ in
            return WelcomeViewModel()
        }
    }
}
