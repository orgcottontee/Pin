//
//  PinApp.swift
//  Pin
//
//  Created by adobada on 4/2/24.
//

import SwiftData
import SwiftUI

@main
struct JingPin: App {
    
    let boutiqueManager = BoutiqueManager()
    @State private var networkMonitor = NetworkMonitor()
    
    var body: some Scene {
        WindowGroup {
            SplashScreenView()
                .environment(boutiqueManager)
                .environment(networkMonitor)
        }
        .modelContainer(for: [FavoriteBoutique.self])
    }
}
