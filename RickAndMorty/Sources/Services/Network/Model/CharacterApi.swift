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
        return CharacterModel(id: id, name: name, status: status, species: species,
                              type: type, gender: gender, image: image,
                              episode: episode, url: url, created: created)
    }
}

enum Gender: String, Codable {
    case female = "Женщина"
    case male = "Мужчина"
    case unknown = "Что это?"
}

struct Location: Codable {
    let name: String
    let url: String
}

enum Species: String, Codable {
    case alien = "Пришелец"
    case cronenberg = "Кроненберг"
    case human = "Человек"
}

enum Status: String, Codable {
    case alive = "Жив"
    case dead = "Мертв"
    case unknown = "Неизвестно"
}
