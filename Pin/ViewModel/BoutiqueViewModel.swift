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
    
    var alertItem: AlertItem?
    var isShowingOnboardingView: Bool = true
    var isLoading: Bool = false
    var isSearchTextfieldVisible: Bool = false
    var selectedState: USState = USState.allStates
    var searchText: String = ""
    
    // MARK: - Actions
    
    @MainActor
    func getUSBoutiques(for boutiqueManager: BoutiqueManager) {
        
        showLoadingView()
        
        Task {
            do {
                boutiqueManager.locations = try await CloudKitManager.shared.fetchUSBoutiques()   
            
                hideLoadingView()
            } catch {
                hideLoadingView()
                alertItem = AlertContext.unableToGetLocations
                print(error.localizedDescription)
            }
        }
    }
    
    private func showLoadingView() { return isLoading = true }
    private func hideLoadingView() { return isLoading = false }
}
