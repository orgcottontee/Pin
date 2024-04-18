//
//  PinApp.swift
//  Pin
//
//  Created by adobada on 4/2/24.
//

import SwiftUI
import SwiftData

@main
struct PinApp: App {
    
    let locationManager = BoutiqueManager()
    
    var body: some Scene {
        WindowGroup {
            AppTabView()
                .environmentObject(locationManager)
        }
        .modelContainer(for: FavoriteBoutique.self)
    }
}
