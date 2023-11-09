//
//  EpisodeApi.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 09.11.2023.
//

import Foundation

struct EpisodeApi: Decodable {
    let id: Int
    let name: String?
    let date: String?
    let episodeSeason: String?
    
    private enum CodingKeys: String, CodingKey {
        case id, name
        case date = "air_date"
        case episodeSeason = "episode"
    }
}

extension EpisodeApi: DomainConvertible {
    func asDomain() -> EpisodeModel {
        return EpisodeModel(id: id, name: name, date: date, episodeSeason: episodeSeason)
    }
}
