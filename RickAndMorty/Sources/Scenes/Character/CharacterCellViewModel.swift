//
//  CharacterCellViewModel.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 10.11.2023.
//

import UIKit

protocol CharacterCellViewModelDelegate: AnyObject {
    func characterCellViewModelDidTap(_ viewModel: CharacterCellViewModel, character: CharacterModel, imageData: Data)
}

class CharacterCellViewModel {
    // MARK: - Properties
    weak var delegate: CharacterCellViewModelDelegate?
    
    var name: String {
        return character.name
    }
    
    var species: String {
        let text = character.species.rawValue + ", " + character.gender.rawValue
        return text
    }
    
    var status: Status {
        return character.status
    }
    
    var statusColor: UIColor {
        switch character.status {
        case .alive:
            return .accentGreen
        case .dead:
            return .accentRed
        case .unknown:
            return .darkGray
        }
    }
    
    var imageData: Data? {
        return imageService.getImageDataFromCache(with: character.image)
    }
    
    private let character: CharacterModel
    private let imageService: ImageServiceProtocol & ImageDataServiceCachingProtocol
        
    // MARK: - Init
    init(_ character: CharacterModel, imageService: ImageServiceProtocol & ImageDataServiceCachingProtocol) {
        self.character = character
        self.imageService = imageService
    }
    
    // MARK: - Public methods
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
    
    func select() {
        delegate?.characterCellViewModelDidTap(self, character: character, imageData: imageData ?? Data())
    }
}

// MARK: - TableCellViewModel
extension CharacterCellViewModel: TableCellViewModel {
    var tableReuseIdentifier: String {
        return CharacterCell.reuseIdentifier
    }
}
