//
//  JingPinError.swift
//  JingPin
//
//  Created by adobada on 5/2/24.
//

import Foundation

enum JingPinError: Error, LocalizedError {
    case locationsUnavailable
    
    var errorDescription: String? {
        switch self {
        case .locationsUnavailable:
            "Failed to find boutiques"
        }
    }
    
    var failureReason: String {
        switch self {
        case .locationsUnavailable:
            "We're having trouble locating the boutiques at this time, please try again later."
        }
    }
}
