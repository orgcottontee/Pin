//
//  BoutiqueMapViewModel.swift
//  Pin
//
//  Created by adobada on 4/10/24.
//

import SwiftUI
import Observation
import CloudKit

@Observable
final class BoutiqueViewModel {
    
    // MARK: - Properties
    
    var selectedState: USState = USState.allStates
    var searchText: String = ""
    var hasError: Bool = false
    var isLoading: Bool = false
    var isSearchTextfieldVisible: Bool = false
    var jingPinError: JingPinError?
    var isAccountStatusAlertShowing: Bool = false
    private(set) var accountStatus: CKAccountStatus = .couldNotDetermine
        
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
                jingPinError = .locationsUnavailable
                print("-----\(error.localizedDescription)-----")
            }
        }
    }
    
    func fetchAccountStatus() async {
        do {
            accountStatus = try await CloudKitManager.shared.checkAccountStatus()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    @ViewBuilder func createBoutiqueDetailView(for boutique: UnitedStatesBoutique, in dynamicTypeSize: DynamicTypeSize) -> some View {
        if dynamicTypeSize > .xxxLarge {
            BoutiqueDetailScreen(viewModel: BoutiqueDetailViewModel(boutiqueLocation: boutique)).embedInScrollView()
        } else {
            BoutiqueDetailScreen(viewModel: BoutiqueDetailViewModel(boutiqueLocation: boutique))
        }
    }
    
    private func showLoadingView() { return isLoading = true }
    private func hideLoadingView() { return isLoading = false }
}
