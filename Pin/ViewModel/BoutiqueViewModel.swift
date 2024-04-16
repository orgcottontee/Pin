//
//  BoutiqueMapViewModel.swift
//  Pin
//
//  Created by adobada on 4/10/24.
//

import MapKit
import SwiftUI

final class BoutiqueViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Published var alertItem: AlertItem?
    @Published var isShowingOnboardingView: Bool = true
    @Published var isLoading: Bool = false
    
    // MARK: - Actions
    
    @MainActor
    func getLocations(for locationManager: LocationManager) {
        Task {
            do {
                isLoading = true
                locationManager.locations = try await CloudKitManager.shared.getBoutiqueLocations()
            } catch {
                alertItem = AlertContext.unableToGetLocations
                print(error.localizedDescription)
            }
            isLoading = false
        }
    }
}
