//
//  CharacterResult.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 10.11.2023.
//

import Foundation

struct CharacterResult: Decodable {
    let results: [CharacterApi]
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        results = try container.decode([CharacterApi].self)
    }
}
