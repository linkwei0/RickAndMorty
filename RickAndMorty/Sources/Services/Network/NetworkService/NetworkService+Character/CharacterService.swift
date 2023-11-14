//
//  CharacterService.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 10.11.2023.
//

import Foundation

protocol CharacterServiceProtocol {
    func getCharacters(page: Int, completion: @escaping (Result<TestResult, NetworkError>) -> Void)
    func getCharactersByEpisode(with charadcterIDs: String, completion: @escaping (Result<CharacterResult, NetworkError>) -> Void)
}

class CharacterService: NetworkService, CharacterServiceProtocol {
    let session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        let configuration = URLSessionConfiguration.default
        configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        self.init(configuration: configuration)
    }
    
    func getCharacters(page: Int, completion: @escaping (Result<TestResult, NetworkError>) -> Void) {
        let request = CharacterEndpoint.getCharacters(page: page).request
        fetch(with: request, completion: completion)
    }
    
    func getCharactersByEpisode(with charadcterIDs: String,
                                completion: @escaping (Result<CharacterResult, NetworkError>) -> Void) {
        let request = CharacterEndpoint.getCharactersByEpisode(charactersIDs: charadcterIDs).request
        fetch(with: request, completion: completion)
    }
}
