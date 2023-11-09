//
//  DomainConvertable.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 09.11.2023.
//

import Foundation

protocol DomainConvertible {
    associatedtype Domain
    func asDomain() -> Domain
}
