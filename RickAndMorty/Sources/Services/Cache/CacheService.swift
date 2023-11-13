//
//  CacheService.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 11.11.2023.
//

import Foundation

protocol CacheServiceProtocol {
    func save(key: String, data: Data?)
    func get(key: String) -> Data?
}

final class CacheService: CacheServiceProtocol {
    private var storage = NSCache<NSString, NSData>()
    
    func save(key: String, data: Data?) {
        guard let data = data else { return }
        storage.setObject(data as NSData, forKey: key as NSString)
    }
    
    func get(key: String) -> Data? {
        storage.object(forKey: key as NSString) as? Data
    }
}
