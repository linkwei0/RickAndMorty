//
//  LocationApi.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 16.11.2023.
//

import Foundation

struct LocationApi: Decodable {
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [String]
}

extension LocationApi: DomainConvertible {
    func asDomain() -> LocationModel {
        return LocationModel(id: id, name: name, type: type, dimension: dimension, residents: residents)
    }
}
