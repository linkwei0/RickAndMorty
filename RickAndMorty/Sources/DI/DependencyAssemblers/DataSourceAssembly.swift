//
//  DataSourceAssembly.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 06.11.2023.
//

import Foundation
import Swinject

final class DataStoreAssembly: Assembly {
    func assemble(container: Container) {
        container.register(DataStoreProtocol.self) { _ in
            return DataStoreService()
        }
    }
}
