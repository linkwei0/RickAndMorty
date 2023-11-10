//
//  EpisodesViewModel.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 06.11.2023.
//

import Foundation

class EpisodesViewModel: TableViewModel, SimpleViewStateHandleable {
    // MARK: - Properties
    var sectionViewModels: [TableSectionViewModel] {
        let itemCellViewModels = episodes.compactMap { EpisodeCellViewModel($0) }
        let headerViewModel = EpisodeHeaderViewModel()
        let section = TableSectionViewModel(headerViewModel: headerViewModel)
        section.append(cellViewModels: itemCellViewModels)
        return [section]
    }
    
    var episodes: [EpisodeModel] {
        return viewState.value.currentEntities
    }
    
    var needsPrefetch: Bool {
        return viewState.value.needsPrefetch
    }
    
    private(set) var viewState: Bindable<SimpleViewState<EpisodeModel>> = Bindable(.initial)
    
    private let episodeService: EpisodeServiceProtocol
    
    // MARK: - Init
    init(episodeService: EpisodeServiceProtocol) {
        self.episodeService = episodeService
    }
    
    // MARK: - Public methods
    func viewIsReady() {
        fetchEpisodes(page: viewState.value.currentPage)
    }
    
    // MARK: - Private methods
    private func fetchEpisodes(page: Int) {
        episodeService.getEpisodes(page: page) { result in
            switch result {
            case .success(let episodeResult):
                let domainModels = episodeResult.results.map { $0.asDomain() }
                self.viewState.value = self.handleableResult(domainModels, currentPage: page, currentEntities: self.episodes)
            case .failure(let error):
                print("Failed to get episodes with error \(error)")
            }
        }
    }
}
