//
//  EpisodeHeaderViewModel.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 09.11.2023.
//

import Foundation

enum EpisodeHeaderConfiguration {
    case title, number, date
    
    var text: String {
        switch self {
        case .title:
            return R.string.episodes.episodesHeaderViewTitle()
        case .number:
            return R.string.episodes.episodesHeaderViewNumber()
        case .date:
            return R.string.episodes.episodesHeaderViewDate()
        }
    }
}

class EpisodeHeaderViewModel {
    var title: String {
        return type[0].text
    }
    
    var numberOfEpisode: String {
        return type[1].text
    }
    
    var dateTitle: String {
        return type[2].text
    }
    
    private let type: [EpisodeHeaderConfiguration] = [.title, .number, .date]
}

extension EpisodeHeaderViewModel: TableHeaderViewModel {
    var tableReuseIdentifier: String {
        return EpisodeHeaderView.reuseIdentifier
    }
}
