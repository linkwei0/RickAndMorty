//
//  HTTPStatusCode.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 09.11.2023.
//

import Foundation

enum HTTPStatusCode {
    static let okStatus = 200...299
    static let badRequest = 400...499
    static let internalServerError = 500...599
}
