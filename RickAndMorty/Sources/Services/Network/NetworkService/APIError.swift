//
//  APIError.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 09.11.2023.
//

import Foundation

enum NetworkError: LocalizedError {
    case clientError
    case serverError
    case unknownError
    case errorInUrl
    case errorDecoding
    
    var errorDescription: String? {
      switch self {
      case .errorDecoding:
        return "Failed to decode data"
      case .serverError:
        return "Server error"
      case .errorInUrl:
        return "Error in URL"
      case .clientError:
        return "Failed in client"
      case .unknownError:
          return "Unknown error"
      }
    }
}
