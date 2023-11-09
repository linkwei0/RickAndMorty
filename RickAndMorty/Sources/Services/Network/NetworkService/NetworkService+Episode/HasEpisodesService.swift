//
//  HasEpisodesService.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 06.11.2023.
//

import Foundation

protocol HasEpisodesService {
    var episodesService: EpisodesProtocol { get }
}

protocol EpisodesProtocol {
    func getEpisodes(completion: @escaping (Result<[EpisodeApi], Error>) -> Void)
}
