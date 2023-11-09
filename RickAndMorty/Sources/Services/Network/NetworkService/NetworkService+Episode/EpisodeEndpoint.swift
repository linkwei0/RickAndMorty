//
//  EpisodesEndpoint.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 06.11.2023.
//

import Foundation

enum EpisodeEndpoint {
    case getEpisodes(page: Int)
}

extension EpisodeEndpoint: Endpoint {
    var base: String {
        return NetworkConfiguration.shared.basePath
    }
    
    var path: String {
        switch self {
        case .getEpisodes:
            return "/api/episode"
        }
    }
    
    var headers: [String: String]? {
        return nil
    }
    
    var params: [String: Any]? {
        switch self {
        case .getEpisodes(let page):
            return ["page": page]
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getEpisodes:
            return .get
        }
    }
}
