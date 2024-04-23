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
    
    @State private var viewModel = BoutiqueViewModel()
    @Environment(BoutiqueManager.self) private var manager

    var body: some View {
        
        NavigationStack {
            if viewModel.isLoading {
                LoadingView()
            } else {
                ZStack {
                    Color(.mainScreenBackground).ignoresSafeArea()
                    ScrollView {
                        LazyVStack {
                            ForEach(manager.locations) { boutiqueLocation in
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
                    if manager.locations.isEmpty { viewModel.getUSBoutiques(for: manager) }
                }
            }
        }
        .tint(.accent)
    }
}

#Preview {
    BoutiqueListScreen()
        .environment(BoutiqueManager())
}
