//
//  DIContainer.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 06.11.2023.
//

import Foundation
import Swinject

final class DIContainer {
    static let shared = DIContainer()
    
    let container: Container = Container()
    let assembler: Assembler
    
    init() {
        assembler = Assembler([
                DataStoreAssembly(),
                SceneAssembly()
            ], container: container)
    }
    
    func resolve<T>() -> T {
        guard let resolvedType = container.resolve(T.self) else { fatalError() }
        return resolvedType
    }
}
