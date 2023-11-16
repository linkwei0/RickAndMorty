//
//  LocationEndpoint.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 16.11.2023.
//

import Foundation

enum LocationEndpoint: Endpoint {
    case getLocations(page: Int)
    
    var base: String {
        return NetworkConfiguration.shared.basePath
    }
    
    var path: String {
        switch self {
        case .getLocations:
            return "/api/location"
        }
    }
    
    var headers: [String: String]? {
        return nil
    }
    
    var params: [String: Any]? {
        switch self {
        case .getLocations(let page):
            return ["page": page]
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getLocations:
            return .get
        }
    }
}
