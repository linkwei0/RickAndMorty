//
//  LocationCellViewModel.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 16.11.2023.
//

import Foundation

class LocationCellViewModel {
    var name: String {
        return location.name
    }
    
    var dimension: String {
        return location.dimension
    }
    
    var residentsCount: Int {
        return location.residents.count
    }
    
    private let location: LocationModel
    
    init(_ location: LocationModel) {
        self.location = location
    }
}

extension LocationCellViewModel: TableCellViewModel {
    var tableReuseIdentifier: String {
        return LocationCell.reuseIdentifier
    }
}
