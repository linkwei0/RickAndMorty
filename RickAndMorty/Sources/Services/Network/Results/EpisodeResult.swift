//
//  EpisodeResult.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 09.11.2023.
//

import Foundation

struct EpisodeResult: Decodable {
    let info: InfoApi
    let results: [EpisodeApi]
}
