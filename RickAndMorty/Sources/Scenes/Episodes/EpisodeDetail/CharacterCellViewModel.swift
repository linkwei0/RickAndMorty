//
//  CharacterCellViewModel.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 10.11.2023.
//

import UIKit

class CharacterCellViewModel {
    // MARK: - Properties
    var image: UIImage? {
        return characterImage
    }
    
    var name: String {
        return character.name
    }
    
    var status: String {
        return character.status
    }
    
    private var characterImage: UIImage?
    
    private let character: CharacterModel
    private let imageService: ImageDataServiceProtocol
        
    // MARK: - Init
    init(_ character: CharacterModel, imageService: ImageDataServiceProtocol) {
        self.character = character
        self.imageService = imageService
        getAndConvertImage()
    }
    
    private func getAndConvertImage() {
        imageService.request(urlString: character.image) { result in
            switch result {
            case .success(let imageData):
                self.characterImage = UIImage(data: imageData)
            case .failure:
                self.characterImage = R.image.defaultIconImage()
            }
        }
    }
}

extension CharacterCellViewModel: TableCellViewModel {
    var tableReuseIdentifier: String {
        return CharacterCell.reuseIdentifier
    }
}
