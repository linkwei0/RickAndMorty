//
//  EpisodeCellViewModel.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 09.11.2023.
//

import Foundation

protocol EpisodeCellViewModelDelegate: AnyObject {
    func episodeCellViewModelDidSelect(_ viewModel: EpisodeCellViewModel, episode: EpisodeModel)
}

class EpisodeCellViewModel {
    // MARK: - Properties
    weak var delegate: EpisodeCellViewModelDelegate?
    
    var episodeName: String {
        return episode.name
    }
    
    var episodeNumber: String {
        return episode.episodeSeason
    }
    
    var episodeDate: String {
        return configureDateOfEpisode()
    }
    
    private let episode: EpisodeModel
    
    // MARK: - Init
    init(_ episode: EpisodeModel) {
        self.episode = episode
    }
    
    func select() {
        delegate?.episodeCellViewModelDidSelect(self, episode: episode)
    }
    
    // MARK: - Private methods
    private func configureDateOfEpisode() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyyy"
        let convertToDate = dateFormatter.date(from: episode.date)
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.dateFormat = "dd MMMM yyyy"
        let resultDate = dateFormatter.string(from: convertToDate ?? Date())
        return resultDate
    }
}

// MARK: - TableCellViewModel
extension EpisodeCellViewModel: TableCellViewModel {
    var tableReuseIdentifier: String {
        return EpisodeCell.reuseIdentifier
    }
}
