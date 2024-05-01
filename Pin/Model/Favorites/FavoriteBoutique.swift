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
    let savedDate: Date = Date.now
    let name: String = ""
    
    @Relationship(deleteRule: .cascade) var favoriteNotes: [FavoriteNote]?
    
    init(boutiqueID: String, favoritedAt: Date, name: String) {
        self.boutiqueID = boutiqueID
        self.savedDate = favoritedAt
        self.name = name
    }
}
