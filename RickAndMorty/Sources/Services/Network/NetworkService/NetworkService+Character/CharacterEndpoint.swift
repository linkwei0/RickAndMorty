//
//  CharacterEndpoint.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 10.11.2023.
//

import Foundation

enum CharacterEndpoint {
    case getCharacters(page: Int)
    case getCharactersByEpisode(charactersIDs: String)
}

extension CharacterEndpoint: Endpoint {
    var base: String {
        return NetworkConfiguration.shared.basePath
    }
    
    var path: String {
        switch self {
        case .getCharacters:
            return "/api/character"
        case .getCharactersByEpisode((let charactersIDs)):
            return "/api/character/\(charactersIDs)"
        }
    }
    
    var headers: [String: String]? {
        return nil
    }
    
    var params: [String: Any]? {
        switch self {
        case .getCharacters(let page):
            return ["page": page]
        default:
            return nil
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getCharacters, .getCharactersByEpisode:
            return .get
        }
    }
}
