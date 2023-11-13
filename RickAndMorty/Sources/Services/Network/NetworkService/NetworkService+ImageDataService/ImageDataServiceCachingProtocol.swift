//
//  ImageDataServiceCachingProtocol.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 12.11.2023.
//

import Foundation

protocol ImageDataServiceCachingProtocol {
    func getImageDataFromCache(with key: String) -> Data?
    func saveImageDataInCache(with key: String, data: Data?)
}
