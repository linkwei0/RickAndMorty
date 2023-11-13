//
//  ImageDataService.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 10.11.2023.
//

import Foundation

protocol ImageServiceProtocol {
    func request(urlString: String, completion: @escaping (Result<Data, NetworkError>) -> Void)
}

final class ImageService: NetworkService, ImageServiceProtocol {
    // MARK: - Properties
    let session: URLSession
    
    private let cacheService: CacheServiceProtocol
    
    // MARK: - Init
    init(configuration: URLSessionConfiguration, cacheService: CacheServiceProtocol = CacheService()) {
        session = URLSession(configuration: configuration)
        self.cacheService = cacheService
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

// MARK: - ImageDataServiceCachingProtocol
extension ImageService: ImageDataServiceCachingProtocol {
    func getImageDataFromCache(with key: String) -> Data? {
        let imageData = cacheService.get(key: key)
        return imageData
    }
    
    func saveImageDataInCache(with key: String, data: Data?) {
        cacheService.save(key: key, data: data)
    }
}
