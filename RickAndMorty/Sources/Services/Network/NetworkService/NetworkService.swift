//
//  NetworkService.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 06.11.2023.
//

import Foundation

protocol NetworkService {
    var session: URLSession { get }
    func fetch<T: Decodable>(with request: URLRequest, completion: @escaping (Result<T, NetworkError>) -> Void)
}

extension NetworkService {
    func fetch<T: Decodable>(with request: URLRequest, completion: @escaping (Result<T, NetworkError>) -> Void) {
        startRequest(request: request, completion: completion)
    }
    
    private func startRequest<T: Decodable>(request: URLRequest, completion: @escaping (Result<T, NetworkError>) -> Void) {
        let task = session.dataTask(with: request) { data, response, _ in
            guard let response = response, let data = data else { completion(.failure(.serverError)); return }
            self.validateResponse(response: response, data: data, completion: completion)
        }
        task.resume()
    }
    
    private func validateResponse<T: Decodable>(response: URLResponse, data: Data,
                                                completion: @escaping (Result<T, NetworkError>) -> Void) {
        guard let httpResponse = response as? HTTPURLResponse else { completion(.failure(.errorInUrl)); return }
        switch httpResponse.statusCode {
        case HTTPStatusCode.okStatus:
            decode(data: data, completion: completion)
        case HTTPStatusCode.badRequest:
            completion(.failure(.clientError))
        case HTTPStatusCode.internalServerError:
            completion(.failure(.serverError))
        default:
            completion(.failure(.unknownError))
        }
    }
    
    private func decode<T: Decodable>(data: Data, completion: @escaping (Result<T, NetworkError>) -> Void) {
        let decoder = JSONDecoder()
        let object = try? decoder.decode(T.self, from: data)
        guard let object = object else { completion(.failure(.errorDecoding)); return }
        completion(.success(object))
    }
}
