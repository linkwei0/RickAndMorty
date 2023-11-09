//
//  URLRequest+Headers.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 06.11.2023.
//

import Foundation

extension URLRequest {
    mutating func setJSONContentType() {
        setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
    }
    
    mutating func setHeader(for httpHeaderField: String, with value: String) {
        setValue(value, forHTTPHeaderField: httpHeaderField)
    }
}
