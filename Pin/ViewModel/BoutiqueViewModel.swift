//
//  BoutiqueMapViewModel.swift
//  Pin
//
//  Created by adobada on 4/10/24.
//

import MapKit
import SwiftUI
import Observation

@Observable
final class BoutiqueViewModel {
    
    // MARK: - Properties
    
    var selectedState: USState = USState.allStates
    var searchText: String = ""
    var hasError: Bool = false
    var isLoading: Bool = false
    var isSearchTextfieldVisible: Bool = false
    var alertItem: AlertItem?
    
    // MARK: - Actions
    
    @MainActor
    func getUSBoutiques(for boutiqueManager: BoutiqueManager) {
        
        showLoadingView()
        
        Task {
            do {
                boutiqueManager.locations = try await CloudKitManager.shared.fetchUSBoutiques()
                hideLoadingView()
            } catch {
                hasError = true
                alertItem = AlertContext.unableToGetLocations
                print(error.localizedDescription)
            }
        }
    }
    
    private func showLoadingView() { return isLoading = true }
    private func hideLoadingView() { return isLoading = false }
}
