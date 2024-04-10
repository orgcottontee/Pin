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

// MARK: - Shorthand website link for button on Details page

enum ShorthandURL {
    static let toiro = "toirokitchen.com"
}

// MARK: - Record type from CloudKit

enum RecordType {
    static let USBoutique = "UnitedStatesBoutique" // Has to match the CloudKit record type name
    static let userSuggestion = "PinAppUserSuggestion"
}

// MARK: - Placeholder images {

enum PlaceholderImage {
    static let square = UIImage(resource: .appSquareLogo)
    static let banner = UIImage(resource: .appBanner)
    static let logo = UIImage(resource: .appLogo)
}

enum ImageDimension {
    case square, banner, logo
    
    static func getPlaceHolder(for dimension: ImageDimension) -> UIImage {
        switch dimension {
        case .square:
            return PlaceholderImage.square
        case .banner:
            return PlaceholderImage.banner
        case .logo:
            return PlaceholderImage.logo
        }
    }
}

