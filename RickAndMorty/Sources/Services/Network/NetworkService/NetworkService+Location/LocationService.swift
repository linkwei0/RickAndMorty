//
//  LocationService.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 16.11.2023.
//

import Foundation

protocol LocationServiceProtocol {
    func getLocations(page: Int, completion: @escaping (Result<LocationResult, NetworkError>) -> Void)
}

final class LocationService: NetworkService, LocationServiceProtocol {
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

    func getLocations(page: Int, completion: @escaping (Result<LocationResult, NetworkError>) -> Void) {
        let request = LocationEndpoint.getLocations(page: page).request
        fetch(with: request, completion: completion)
    }
}
