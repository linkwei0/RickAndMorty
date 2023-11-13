//
//  EpisodeDetailAssembly.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 13.11.2023.
//

import Foundation
import Swinject

final class EpisodeDetailAssembly: Assembly {
    func assemble(container: Container) {
        container.register(CharacterServiceProtocol.self) { _ in
            return CharacterService()
        }
        
        container.register(CacheServiceProtocol.self) { _ in
            return CacheService()
        }
        
        container.register((ImageServiceProtocol & ImageDataServiceCachingProtocol).self) { resolver in
            guard let cacheService = resolver.resolve(CacheServiceProtocol.self) else { fatalError() }
            return ImageService(cacheService: cacheService)
        }
        
        container.register(EpisodeDetailViewModel.self) { (resolver, episode: EpisodeModel) in
            guard let characterService = resolver.resolve(CharacterServiceProtocol.self) else { fatalError() }
            guard let imageService = resolver
                .resolve((ImageServiceProtocol & ImageDataServiceCachingProtocol).self) else { fatalError() }
            
            return EpisodeDetailViewModel(characterService: characterService, imageService: imageService, episode: episode)
        }
    }
}
