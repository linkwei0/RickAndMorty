//
//  EpisodeDetailViewModel.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 10.11.2023.
//

import Foundation

protocol EpisodeDetailViewModelDelegate: AnyObject {
    func viewModelDidRequestToShowCharacterDetail(_ viewModel: EpisodeDetailViewModel, character: CharacterModel, imageData: Data)
}

class EpisodeDetailViewModel: TableViewModel, SimpleViewStateHandleable {
    // MARK: - Properties
    weak var delegate: EpisodeDetailViewModelDelegate?
    
    var sectionViewModels: [TableSectionViewModel] {
        let cellViewModels = characters.map { character in
            let cellViewModel = CharacterCellViewModel(character, imageService: imageService)
            cellViewModel.delegate = self
            return cellViewModel
        }
        let section = TableSectionViewModel()
        section.append(cellViewModels: cellViewModels)
        return [section]
    }
    
    var characters: [CharacterModel] {
        return viewState.value.currentEntities
    }
    
    var needsPrefetch: Bool {
        return viewState.value.needsPrefetch
    }
    
    private(set) var viewState: Bindable<SimpleViewState<CharacterModel>> = Bindable(.initial)
    
    private let characterService: CharacterServiceProtocol
    private let imageService: ImageServiceProtocol & ImageDataServiceCachingProtocol
    private var episode: EpisodeModel?
    
    // MARK: - Init
    init(characterService: CharacterServiceProtocol,
         imageService: (ImageServiceProtocol & ImageDataServiceCachingProtocol),
         episode: EpisodeModel? = nil) {
        self.characterService = characterService
        self.imageService = imageService
        self.episode = episode
    }
        
    // MARK: - Public methods
    func viewIsReady() {
        if let episode = episode {
            fetchCharacters(by: episode)
        } else {
            fetchAllCharacters(page: viewState.value.currentPage)
        }
    }
    
    // MARK: - Private methods
    private func fetchCharacters(by episode: EpisodeModel) {
        let characterIDs = episode.characterIDs.map { String($0) }.joined(separator: ",")
        characterService.getCharactersByEpisode(with: characterIDs) { result in
            switch result {
            case .success(let characterResult):
                let domainModels = characterResult.results.map { $0.asDomain() }
                self.viewState.value = self.handleableResult(domainModels)
            case .failure(let error):
                print("Failed to get characters by episode with \(error)")
            }
        }
    }
    
    private func fetchAllCharacters(page: Int) {
        characterService.getCharacters(page: page) { result in
            switch result {
            case .success(let characterResult):
                let domainModels = characterResult.results.map { $0.asDomain() }
                self.viewState.value = self.handleableResult(domainModels, currentPage: page,
                                                             currentEntities: self.characters)
            case .failure(let error):
                print("Failed to get all characters with \(error)")
            }
        }
    }
}

// MARK: - CharacterCellViewModelDelegate
extension EpisodeDetailViewModel: CharacterCellViewModelDelegate {
    func characterCellViewModelDidTap(_ viewModel: CharacterCellViewModel, character: CharacterModel, imageData: Data) {
        delegate?.viewModelDidRequestToShowCharacterDetail(self, character: character, imageData: imageData)
    }
}
