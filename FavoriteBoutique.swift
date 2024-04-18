//
//  FavoriteBoutique.swift
//  JingPin
//
//  Created by adobada on 4/17/24.
//

import Foundation
import SwiftData

@Model
final class FavoriteBoutique: Identifiable {
    
    let id: String = ""
    let name: String = ""
    let city: String = ""
    let state: String = ""
    let website: String = ""
    
    init(id: String, name: String, city: String, state: String, website: String) {
        self.id = id
        self.name = name
        self.city = city
        self.state = state
        self.website = website
    }
}
