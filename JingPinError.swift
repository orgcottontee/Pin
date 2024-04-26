//
//  JingPinError.swift
//  JingPin
//
//  Created by adobada on 4/26/24.
//

import Foundation

enum JingPinError: Error, LocalizedError {

    case invalidAccessToken
    case invalidURL
    case invalidResponse
    case unableToDecode
    case unknown(code: Int)

    var errorDescription: String? {
        switch self {
        case .invalidAccessToken:
            return "Invalid Access Token"
        case .invalidURL:
            return "Invalid URL"
        case .invalidResponse:
            return "We're experiencing some server issues. Please try again."
        case .unableToDecode:
            return "Decoding Issues"
        case .unknown(code: let code):
            return "unknown \(code)"
        }
    }
}
