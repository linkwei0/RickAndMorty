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
        container.register(EpisodeServiceProtocol.self) { _ in
            return EpisodeService()
        }
        
        container.register(EpisodesViewModel.self) { resolver in
            guard let episodeService = resolver.resolve(EpisodeServiceProtocol.self) else { fatalError() }
            return EpisodesViewModel(episodeService: episodeService)
        }
    }
}
