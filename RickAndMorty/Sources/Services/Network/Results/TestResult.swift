//
//  TestResult.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 14.11.2023.
//

import Foundation

struct TestResult: Decodable {
    let info: InfoApi
    let results: [CharacterApi]
}
