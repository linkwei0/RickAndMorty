//
//  InfoApi.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 09.11.2023.
//

import Foundation

struct InfoApi: Decodable {
    let next: String?
    let prev: String?
}
