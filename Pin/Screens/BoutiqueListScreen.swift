//
//  BoutiqueListScreen.swift
//  Pin
//
//  Created by adobada on 4/3/24.
//

import SwiftUI
import SwiftData
import CloudKit

struct BoutiqueListScreen: View {
    
    init() { NavBar.configureAppearance() }
    
    @StateObject private var viewModel = BoutiqueViewModel()
    @EnvironmentObject private var boutiqueManager: BoutiqueManager
    
    var body: some View {
        
        NavigationStack {
            if viewModel.isLoading {
                LoadingView()
            } else {
                ZStack {
                    Color(.mainScreenBackground).ignoresSafeArea()
                    ScrollView {
                        LazyVStack {
                            ForEach(boutiqueManager.locations) { boutiqueLocation in
                                NavigationLink(value: boutiqueLocation) {
                                    BoutiqueCellView(boutiqueLocation: boutiqueLocation)
                                }
                            }
                        }
                    }
                    .padding()
                    .navigationDestination(for: UnitedStatesBoutique.self) { boutique in
                        BoutiqueDetailScreen(viewModel: BoutiqueDetailViewModel(boutiqueLocation: boutique))
                        // TODO: Filter by state, search bar
                    }
                }
                .alert(item: $viewModel.alertItem) { alertItem in
                    Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
                }
                .onAppear {
                    if boutiqueManager.locations.isEmpty { viewModel.getUSBoutiques(for: boutiqueManager) }
                }
            }
        }
        .tint(.accent)
    }
}

#Preview {
    BoutiqueListScreen()
        .environmentObject(BoutiqueManager())
}
