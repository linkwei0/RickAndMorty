//
//  SimpleViewStateHandleable.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 10.11.2023.
//

import Foundation

protocol SimpleViewStateHandleable {
    func handleableResult<T>(_ entities: [T], currentPage: Int, currentEntities: [T]) -> SimpleViewState<T>
}

extension SimpleViewStateHandleable {
    func handleableResult<T>(_ entities: [T], currentPage: Int, currentEntities: [T]) -> SimpleViewState<T> {
        var allEntites = currentPage == 1 ? [] : currentEntities
        allEntites.append(contentsOf: entities)
        return entities.isEmpty ? .populated(allEntites) : .paging(allEntites, page: currentPage + 1)
    }
}
