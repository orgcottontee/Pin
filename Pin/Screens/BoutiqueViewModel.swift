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
    
    // MARK: - Actions
    
    func getLocations(for locationManager: LocationManager) {
        CloudKitManager.getLocations { [self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let locations):
                    locationManager.locations = locations
                case .failure(_):
                    self.alertItem = AlertContext.unableToGetLocations
                }
            }
        }
    }
}
