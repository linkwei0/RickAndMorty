//
//  EpisodesService.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 06.11.2023.
//

import Foundation

protocol EpisodeServiceProtocol {
    func getEpisodes(page: Int, completion: @escaping (Result<EpisodeResult, NetworkError>) -> Void)
}

final class EpisodeService: NetworkService, EpisodeServiceProtocol {
    // MARK: - Properties
    let session: URLSession
    
    // MARK: - Init
    init(configuration: URLSessionConfiguration) {
        session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        let configuration = URLSessionConfiguration.default
        configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        self.init(configuration: configuration)
    }
    
    // MARK: - Episodes
    func getEpisodes(page: Int, completion: @escaping (Result<EpisodeResult, NetworkError>) -> Void) {
        let request = EpisodeEndpoint.getEpisodes(page: page).request
        fetch(with: request, completion: completion)
    }
}
