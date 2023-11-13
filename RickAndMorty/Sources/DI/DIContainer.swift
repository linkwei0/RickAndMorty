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
    
    func resolve<T, Arg>(argument: Arg) -> T {
        guard let resolvedType = container.resolve(T.self, argument: argument) else { fatalError() }
        return resolvedType
    }
    
    func resolve<T, Arg1, Arg2>(argument1: Arg1, argument2: Arg2) -> T {
        guard let resolvedType = container.resolve(T.self, arguments: argument1, argument2) else { fatalError() }
        return resolvedType
    }
}
