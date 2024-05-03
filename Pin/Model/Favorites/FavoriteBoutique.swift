//
//  FavoriteBoutique.swift
//  JingPin
//
//  Created by adobada on 4/17/24.
//

import Foundation
import SwiftData

@Model
final class FavoriteBoutique {
    
    let boutiqueID: String = "" // ID of boutique record from public database
    let name: String = ""
    let city: String = ""
    let state: String = ""
    let savedDate: Date = Date.now
    
    @Relationship(deleteRule: .cascade) var favoriteNotes: [FavoriteNote]?
    
    init(boutiqueID: String, name: String, city: String, state: String, savedDated: Date) {
        self.boutiqueID = boutiqueID
        self.name = name
        self.city = city
        self.state = state
        self.savedDate = savedDated
    }
}
