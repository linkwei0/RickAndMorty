//
//  SceneAssembly.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 06.11.2023.
//

import Foundation
import Swinject

final class SceneAssembly: Assembly {
    func assemble(container: Container) {
        let assemblies: [Assembly] = [
            WelcomeAssembly(),
            MenuAssembly(),
            EpisodesAssembly(),
            EpisodeDetailAssembly(),
            CharacterDetailAssembly()
        ]
        assemblies.forEach { $0.assemble(container: container) }
    }
}
