//
//  FavoriteNote.swift
//  JingPin
//
//  Created by adobada on 4/22/24.
//

import Foundation
import SwiftData

@Model
final class FavoriteNote {
    
    var note: String = ""
    var favoriteBoutique: FavoriteBoutique?
    
    init(note: String) {
        self.note = note
    }
}
