//
//  ImageDataService.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 10.11.2023.
//

import Foundation

protocol ImageDataServiceProtocol {
    func request(urlString: String, completion: @escaping (Result<Data, NetworkError>) -> Void)
}

final class ImageDataService: NetworkService, ImageDataServiceProtocol {
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
    
    func request(urlString: String, completion: @escaping (Result<Data, NetworkError>) -> Void) {
        guard let url = URL(string: urlString) else { completion(.failure(.errorInUrl)); return }
        let request = URLRequest(url: url)
        fetch(with: request, completion: completion)
    }
}
