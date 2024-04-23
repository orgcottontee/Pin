//
//  PinApp.swift
//  Pin
//
//  Created by adobada on 4/2/24.
//

import SwiftData
import SwiftUI

@main
struct PinApp: App {
    
    let boutiqueManager = BoutiqueManager()
    
    var body: some Scene {
        WindowGroup {
            AppTabView()
                .environment(boutiqueManager)
        }
        .modelContainer(for: [FavoriteBoutique.self])
    }
}
