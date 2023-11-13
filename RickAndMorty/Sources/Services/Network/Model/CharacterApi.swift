//
//  CharacterApi.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 10.11.2023.
//

import Foundation

struct CharacterApi: Decodable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

extension CharacterApi: DomainConvertible {
    func asDomain() -> CharacterModel {
        guard let status = Status(rawValue: status),
              let species = Species(rawValue: species),
              let gender = Gender(rawValue: gender) else { return CharacterModel.makeCleanModel() }
        return CharacterModel(id: id, name: name, status: status, species: species,
                              type: type, gender: gender, image: image,
                              episode: episode, url: url, created: created)
    }
}
