//
//  LocationListViewModel.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 16.11.2023.
//

import Foundation

class LocationListViewModel: TableViewModel, SimpleViewStateHandleable {
    // MARK: - Properties
    var sectionViewModels: [TableSectionViewModel] {
        let itemViewModels = locations.map { LocationCellViewModel($0) }
        let section = TableSectionViewModel()
        section.append(cellViewModels: itemViewModels)
        return [section]
    }

    var needsPrefetch: Bool {
        return viewState.value.needsPrefetch
    }
    
    var locations: [LocationModel] {
        return viewState.value.currentEntities
    }
    
    private(set) var viewState: Bindable<SimpleViewState<LocationModel>> = Bindable(.initial)
    
    private let locationService: LocationServiceProtocol
    
    // MARK: - Init
    init(locationService: LocationServiceProtocol) {
        self.locationService = locationService
    }
    
    // MARK: - Public methods
    func viewIsReady() {
        getLocations(page: viewState.value.currentPage)
    }
    
    // MARK: - Private methods
    private func getLocations(page: Int) {
        locationService.getLocations(page: page) { result in
            switch result {
            case .success(let locationResult):
                let domainModels = locationResult.results.map { $0.asDomain() }
                self.viewState.value = self.handleableResult(domainModels, currentPage: page,
                                                             currentEntities: self.locations)
            case .failure(let error):
                print("Failed to get locations with \(error)")
            }
        }
    }
}
