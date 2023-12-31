//
//  TestResult.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 16.11.2023.
//

import Foundation

struct CharacterResult: Decodable {
    let info: InfoApi
    let results: [CharacterApi]
}
