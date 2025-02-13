//
//  CharacterPageViewModel.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 12.11.2023.
//

import UIKit

enum CharacterPageItemType {
    case name(_ name: String)
    case status(_ status: Status)
    case specie(_ specie: Species)
    case gender(_ gender: Gender)
    case episodesCount(_ count: Int)
    
    var titleText: String {
        switch self {
        case .name:
            return R.string.characterPage.characterPageTypeName()
        case .status:
            return R.string.characterPage.characterPageTypeStatus()
        case .specie:
            return R.string.characterPage.characterPageTypeSpecie()
        case .gender:
            return R.string.characterPage.characterPageTypeGender()
        case .episodesCount:
            return R.string.characterPage.characterPageTypeEpisodesCount()
        }
    }
    
    var infoText: String {
        switch self {
        case .name(let name):
            return name
        case .status(let status):
            return status.rawValue
        case .specie(let specie):
            return specie.rawValue
        case .gender(let gender):
            return gender.rawValue
        case .episodesCount(let count):
            return String(count)
        }
    }
    
    var textColor: UIColor {
        switch self {
        case .status(let status):
            if (status.isAlive ?? true) || status == .unknown {
                return .accentGreen
            } else {
                return .accentRed
            }
        default:
            return .baseBlack
        }
    }
}

class CharacterPageViewModel {
    let pageItemTypes: [CharacterPageItemType]
    
    private let character: CharacterModel
    
    init(character: CharacterModel) {
        self.character = character
        self.pageItemTypes = [.name(character.name), .status(character.status),
                              .specie(character.species), .gender(character.gender),
                              .episodesCount(character.episode.count)]
    }
}
