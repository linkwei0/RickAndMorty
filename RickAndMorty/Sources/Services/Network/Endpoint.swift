//
//  Endpoint.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 06.11.2023.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

protocol Endpoint {
    var base: String { get }
    var path: String { get }
    var headers: [String: String]? { get }
    var params: [String: Any]? { get }
    var method: HTTPMethod { get }
}

extension Endpoint {
    var urlComponents: URLComponents {
        var components = URLComponents(string: base)!
        components.path = path
        
        var queryItems: [URLQueryItem] = []
        guard let params = params, method == .get else { return components }
        queryItems.append(contentsOf: params.map { URLQueryItem(name: "\($0)", value: "\($1)") })
        components.queryItems = queryItems

        return components
    }
    
    var request: URLRequest {
        let url = urlComponents.url!
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue

        if let headers = headers {
            for (key, value) in headers {
                request.setHeader(for: key, with: value)
            }
        }

        return request
    }
}
