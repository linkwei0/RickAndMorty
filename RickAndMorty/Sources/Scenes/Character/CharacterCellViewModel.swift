//
//  CharacterCellViewModel.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 10.11.2023.
//

import UIKit

class CharacterCellViewModel {
    // MARK: - Properties
    var name: String {
        return character.name
    }
    
    var status: String {
        return character.status.rawValue
    }
    
    var statusColor: UIColor {
        return character.status.isAlive ? .accentGreen : .accentRed
    }
    
    var imageData: Data? {
        return imageService.getImageDataFromCache(with: character.image)
    }
    
    private let character: CharacterModel
    private let imageService: ImageDataServiceProtocol
        
    // MARK: - Init
    init(_ character: CharacterModel, imageService: ImageDataServiceProtocol) {
        self.character = character
        self.imageService = imageService
    }
    
    func getImage(completion: @escaping(Data) -> Void) {
        imageService.request(urlString: character.image) { result in
            switch result {
            case .success(let imageData):
                self.imageService.saveImageDataInCache(with: self.character.image, data: imageData)
                completion(imageData)
            case .failure(let error):
                print("Failed to get image with \(error)")
            }
        }
    }
}

extension CharacterCellViewModel: TableCellViewModel {
    var tableReuseIdentifier: String {
        return CharacterCell.reuseIdentifier
    }
}
