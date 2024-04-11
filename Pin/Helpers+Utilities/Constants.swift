//
//  Constants.swift
//  Pin
//
//  Created by adobada on 4/3/24.
//

import UIKit

// MARK: - Tab view icons

enum TabIcon: String, CaseIterable, Hashable {
    case door = "door"
    case map = "map"
    case profile = "person"
    
    var selected: String {
        switch self {
        case .door:
            return "door.left.hand.open"
        case .map:
            return "mappin"
        case .profile:
            return "person.fill"
            
        }
    }
    
    var unselected: String {
        switch self {
        case .door:
            return "door.left.hand.closed"
        case .map:
            return "map"
        case .profile:
            return "person"
        }
    }
}

// MARK: - App themes

enum AppTheme: String, Identifiable, CaseIterable {
    case system = "System"
    case lightTheme = "Light"
    case darkTheme = "Dark"
    
    var id: String { self.rawValue }
}

// MARK: - Record type from CloudKit

enum RecordType {
    static let USBoutique = "UnitedStatesBoutique" // Has to match the CloudKit record type name
    static let userSuggestion = "PinAppUserSuggestion"
}

// MARK: - Placeholder images {

enum PlaceholderImage {
    static let squareLogo = UIImage(resource: .appSquareLogo)
    static let locationImage = UIImage(resource: .appBanner)
}

enum ImageDimension {
    case squareLogo, locationImage
    
    static func getPlaceHolder(for dimension: ImageDimension) -> UIImage {
        switch dimension {
        case .squareLogo:
            return PlaceholderImage.squareLogo
        case .locationImage:
            return PlaceholderImage.locationImage
        }
    }
}

