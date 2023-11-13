//
//  CharacterDetailViewModel.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 11.11.2023.
//

import Foundation

class CharacterDetailViewModel {
    var onDidUpdate: ((_ characterPageViewModel: CharacterPageViewModel, _ imageData: Data) -> Void)?
    
    private let character: CharacterModel
    private let imageData: Data
    
    private let pageViewModel: CharacterPageViewModel
    
    init(character: CharacterModel, imageData: Data) {
        self.character = character
        self.imageData = imageData
        pageViewModel = CharacterPageViewModel(character: character)
    }
    
    func viewIsReady() {
        getCharacter()
    }
    
    private func getCharacter() {
        onDidUpdate?(pageViewModel, imageData)
    }
}
