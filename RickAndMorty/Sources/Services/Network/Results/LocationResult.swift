//
//  LocationResult.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 16.11.2023.
//

import Foundation

struct LocationResult: Decodable {
    let info: InfoApi
    let results: [LocationApi]
}
