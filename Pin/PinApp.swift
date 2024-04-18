//
//  PinApp.swift
//  Pin
//
//  Created by adobada on 4/2/24.
//

import SwiftUI

@main
struct PinApp: App {
    
    let locationManager = BoutiqueManager()
    
    var body: some Scene {
        WindowGroup {
            AppTabView()
                .environmentObject(locationManager)
        }
    }
}
