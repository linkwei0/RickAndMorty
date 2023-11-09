//
//  DataStoreService.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 06.11.2023.
//

import Foundation

class DataStoreService: DataStoreProtocol {
    private struct UserDefaultsKeys {
        static let welcomeInfo = "welcomeInfo"
    }
    
    private let userDefaults = UserDefaults.standard
    
    var welcomeInfo: Bool {
        get {
            guard let data = userDefaults.data(forKey: UserDefaultsKeys.welcomeInfo),
                  let result = try? JSONDecoder().decode(Bool.self, from: data) else { return false }
            return result
        }
        set {
            let data = (try? JSONEncoder().encode(newValue)) ?? Data()
            userDefaults.setValue(data, forKey: UserDefaultsKeys.welcomeInfo)
        }
    }
}
