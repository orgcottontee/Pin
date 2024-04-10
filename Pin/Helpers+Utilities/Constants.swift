//
//  Constants.swift
//  Pin
//
//  Created by adobada on 4/3/24.
//

import Foundation



// MARK: - Tab icons for root screen

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

enum RecordType {
    static let USBoutique = "UnitedStatesBoutique" // Has to match the CloudKit record type name
    static let userSuggestion = "PinAppUserSuggestion"
}


