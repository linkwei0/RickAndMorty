//
//  CharacterModel.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 10.11.2023.
//

import Foundation

struct CharacterModel {
    let id: Int
    let name: String
    let status: Status
    let species: Species
    let type: String
    let gender: Gender
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

extension CharacterModel {
    static func makeCleanModel() -> CharacterModel {
        return CharacterModel(id: UUID().hashValue, name: "", status: .unknown,
                              species: .human, type: "", gender: .unknown,
                              image: "", episode: [], url: "", created: "")
    }
}

enum Gender: RawRepresentable {
    case female
    case male
    case unknown
    
    var localizedString: String {
        return NSLocalizedString(self.rawValue, comment: "")
    }
    
    var rawValue: String {
        switch self {
        case .female:
            return R.string.character.characterGenderFemale()
        case .male:
            return R.string.character.characterGenderMale()
        case .unknown:
            return R.string.character.characterGenderUnknown()
        }
    }
    
    init?(rawValue: String) {
        switch rawValue {
        case "Female", "female":
            self = .female
        case "Male", "male":
            self = .male
        default:
            self = .unknown
        }
    }
}

struct Location {
    let name: String
    let url: String
}

enum Species: RawRepresentable {
    case alien
    case cronenberg
    case human
    
    var localizedString: String {
        return NSLocalizedString(self.rawValue, comment: "")
    }
    
    var rawValue: String {
        switch self {
        case .alien:
            return R.string.character.characterSpecieAlien()
        case .cronenberg:
            return R.string.character.characterSpecieCronenberg()
        case .human:
            return R.string.character.characterSpecieHuman()
        }
    }
    
    init?(rawValue: String) {
        switch rawValue {
        case "Human", "human":
            self = .human
        case "Cronenberg", "cronenberg":
            self = .cronenberg
        default:
            self = .alien
        }
    }
}

enum Status: RawRepresentable {
    case alive
    case dead
    case unknown
    
    var localizedString: String {
        return NSLocalizedString(self.rawValue, comment: "")
    }
    
    var rawValue: String {
        switch self {
        case .alive:
            return R.string.character.characterStatusAlive()
        case .dead:
            return R.string.character.characterStatusDead()
        case .unknown:
            return R.string.character.characterStatusUnknown()
        }
    }
    
    init?(rawValue: String) {
        switch rawValue {
        case "Alive", "alive":
            self = .alive
        case "Dead", "dead":
            self = .dead
        default:
            self = .unknown
        }
    }
    
    var isAlive: Bool {
        switch self {
        case .alive:
            return true
        case .dead:
            return false
        case .unknown:
            return true
        }
    }
}

