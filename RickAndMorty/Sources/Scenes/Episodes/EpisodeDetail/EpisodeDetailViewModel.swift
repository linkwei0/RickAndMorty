//
//  EpisodeDetailViewModel.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 10.11.2023.
//

import Foundation

class EpisodeDetailViewModel: TableViewModel, SimpleViewStateHandleable {
    // MARK: - Properties
    var sectionViewModels: [TableSectionViewModel] {
        let itemViewModels = characters.map { CharacterCellViewModel($0, imageService: imageService) }
        let section = TableSectionViewModel()
        section.append(cellViewModels: itemViewModels)
        return [section]
    }
    
    var characters: [CharacterModel] {
        return viewState.value.currentEntities
    }
    
    private(set) var viewState: Bindable<SimpleViewState<CharacterModel>> = Bindable(.initial)
    
    private let characterService: CharacterServiceProtocol
    private let imageService: ImageDataServiceProtocol = ImageDataService()
    private let episode: EpisodeModel
    
    // MARK: - Init
    init(characterService: CharacterServiceProtocol, episode: EpisodeModel) {
        self.characterService = characterService
        self.episode = episode
    }
    
    // MARK: - Public methods
    func viewIsReady() {
        fetchCharacters()
    }
    
    // MARK: - Private methods
    private func fetchCharacters() {
        let characterIDs = episode.characterIDs.map { String($0) }.joined(separator: ",")
        characterService.getCharacters(with: characterIDs) { result in
            switch result {
            case .success(let characterResult):
                let domainModels = characterResult.results.map { $0.asDomain() }
                self.viewState.value = self.handleableResult(domainModels)
            case .failure(let error):
                print("Faield to get characters with \(error)")
            }
        }
    }
}
