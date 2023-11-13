//
//  CharacterDetailAssembly.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 13.11.2023.
//

import Foundation
import Swinject

final class CharacterDetailAssembly: Assembly {
    func assemble(container: Container) {
        container.register(CharacterDetailViewModel.self) { _, character, imageData in
            return CharacterDetailViewModel(character: character, imageData: imageData)
        }
    }
}
