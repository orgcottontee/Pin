//
//  Constants.swift
//  Pin
//
//  Created by adobada on 4/3/24.
//

import Foundation

enum Constants {
    
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
}
