//
//  CharacterService.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 10.11.2023.
//

import Foundation

protocol CharacterServiceProtocol {
    func getCharacters(with charadcterIDs: String, completion: @escaping (Result<CharacterResult, NetworkError>) -> Void)
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
    
    func getCharacters(with charadcterIDs: String, completion: @escaping (Result<CharacterResult, NetworkError>) -> Void) {
        let request = CharacterEndpoint.getCharacters(charactersIDs: charadcterIDs).request
        fetch(with: request, completion: completion)
    }
}
