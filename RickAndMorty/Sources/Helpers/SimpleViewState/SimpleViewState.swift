//
//  SimpleViewState.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 10.11.2023.
//

import Foundation

enum SimpleViewState<Entity> {
    case initial
    case paging([Entity], page: Int)
    case populated([Entity])
    
    var currentEntities: [Entity] {
        switch self {
        case .initial:
            return []
        case .paging(let entities, _):
            return entities
        case .populated(let entities):
            return entities
        }
    }
    
    var currentPage: Int {
        switch self {
        case .initial, .populated:
            return 1
        case .paging(_, let page):
            return page
        }
    }
    
    var needsPrefetch: Bool {
        switch self {
        case .initial, .populated:
            return false
        case .paging:
            return true
        }
    }
}
