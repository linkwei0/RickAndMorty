//
//  EpisodesViewModel.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 06.11.2023.
//

import Foundation

class EpisodesViewModel: TableViewModel {
    // MARK: - Properties
    var onDidUpdate: (() -> Void)?
    
    private(set) var sectionViewModels: [TableSectionViewModel] = []
    
    private var nextPage: Int = 0
    
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
                let episodes = episodeResult.results.map { $0.asDomain() }
                self.configureSections(with: episodes)
            case .failure(let error):
                print("Failed to get episodes with error \(error)")
            }
        }
    }
    
    private func configureSections(with episodes: [EpisodeModel]) {
        sectionViewModels.removeAll()
        let itemViewModels = episodes.map { EpisodeCellViewModel($0) }
        if !itemViewModels.isEmpty {
            let headerViewModel = EpisodeHeaderViewModel()
            let section = TableSectionViewModel(headerViewModel: headerViewModel)
            section.append(cellViewModels: itemViewModels)
            self.sectionViewModels.append(section)
        }
        onDidUpdate?()
    }
}
