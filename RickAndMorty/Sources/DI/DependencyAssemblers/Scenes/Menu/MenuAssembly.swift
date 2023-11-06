//
//  MenuAssembly.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 06.11.2023.
//

import Foundation
import Swinject

final class MenuAssembly: Assembly {
    func assemble(container: Container) {
        container.register(MenuViewModel.self) { _ in
            return MenuViewModel()
        }
    }
}
