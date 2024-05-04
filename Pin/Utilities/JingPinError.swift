//
//  JingPinError.swift
//  JingPin
//
//  Created by adobada on 5/2/24.
//

import Foundation

enum JingPinError: Error, LocalizedError {
    
    case locationsUnavailable
    case submissionFailed
    case incompleteForm
    
    var errorDescription: String? {
        switch self {
        case .locationsUnavailable:
            "Failed to find boutiques"
        case .submissionFailed:
            "Failed to submit"
        case .incompleteForm:
            "Incomplete form"
        }
    }
    
    var failureReason: String {
        switch self {
        case .locationsUnavailable:
            "We're having trouble locating the boutiques at this time, please try again later."
        case .submissionFailed:
            "We could not process your submission. Please check that you're logged in to your Apple account in settings."
        case .incompleteForm:
            "Please fill in all fields to submit your suggestion. Thanks!"
        }
    }
}
