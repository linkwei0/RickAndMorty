//
//  NetworkConfiguration.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 06.11.2023.
//

import Foundation

final class NetworkConfiguration {
    static let shared = NetworkConfiguration()
    
    var basePath: String {
        return "https://rickandmortyapi.com"
    }
    
    private init() {}
}
