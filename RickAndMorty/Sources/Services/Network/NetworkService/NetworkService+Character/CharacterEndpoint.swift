//
//  CharacterEndpoint.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 10.11.2023.
//

import Foundation

enum CharacterEndpoint {
    case getCharacters(charactersIDs: String)
}

extension CharacterEndpoint: Endpoint {
    var base: String {
        return NetworkConfiguration.shared.basePath
    }
    
    var path: String {
        switch self {
        case .getCharacters((let charactersIDs)):
            return "/api/character/\(charactersIDs)"
        }
    }
    
    var headers: [String: String]? {
        return nil
    }
    
    var params: [String: Any]? {
        return nil
    }
    
    var method: HTTPMethod {
        switch self {
        case .getCharacters:
            return .get
        }
    }
}
