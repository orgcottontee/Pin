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
    @StateObject private var networkMonitor = NetworkMonitor()
    
    var body: some Scene {
        WindowGroup {
            SplashScreenView()
                .environment(boutiqueManager)
                .environmentObject(networkMonitor)
        }
        .modelContainer(for: [FavoriteBoutique.self])
    }
}
