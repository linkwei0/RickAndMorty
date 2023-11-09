//
//  EpisodesViewModel.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 06.11.2023.
//

import Foundation

class EpisodesViewModel {
    // MARK: - Properties
    private var episodes: [EpisodeModel] = []
    
    private let episodeService: EpisodeServiceProtocol
    
    // MARK: - Init
    init(episodeService: EpisodeServiceProtocol) {
        self.episodeService = episodeService
    }
    
    // MARK: - Public methods
    func viewIsReady() {
        fetchEpisodes(page: 1)
    }
    
    // MARK: - Private methods
    private func fetchEpisodes(page: Int) {
        episodeService.getEpisodes(page: page) { result in
            switch result {
            case .success(let episodeResult):
                self.episodes = episodeResult.results.map { $0.asDomain() }
                
            case .failure(let error):
                print("Failed to get episodes with error \(error)")
            }
        }
    }
}
