//
//  MenuCellViewModel.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 06.11.2023.
//

import UIKit

enum MenuCellType {
    case episodes
    case characters
    case locations
    
    var iconImage: UIImage? {
        switch self {
        case .episodes:
            return R.image.episodesImage()
        case .characters:
            return R.image.charactersImage()
        case .locations:
            return R.image.locationsImage()
        }
    }
    
    var title: String {
        switch self {
        case .episodes:
            return R.string.menu.menuCellTypeEpisodes()
        case .characters:
            return R.string.menu.menuCellTypeCharacters()
        case .locations:
            return R.string.menu.menuCellTypeLocations()
        }
    }
}

class MenuCellViewModel {
    var iconImage: UIImage? {
        return type.iconImage
    }
    
    var title: String {
        return type.title
    }
    
    private let type: MenuCellType
    
    init(type: MenuCellType) {
        self.type = type
    }
}
