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
    
    var text: String = ""
    var favoriteBoutique: FavoriteBoutique?
    
    init(text: String) {
        self.text = text
    }
}
