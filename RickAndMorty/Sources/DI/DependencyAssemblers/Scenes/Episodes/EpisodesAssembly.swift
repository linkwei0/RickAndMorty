//
//  EpisodesAssembly.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 06.11.2023.
//

import Foundation
import Swinject

final class EpisodesAssembly: Assembly {
    func assemble(container: Container) {
        container.register(EpisodesViewModel.self) { _ in
            return EpisodesViewModel()
        }
    }
}
