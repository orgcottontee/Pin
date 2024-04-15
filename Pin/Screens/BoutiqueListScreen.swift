//
//  BoutiqueListScreen.swift
//  Pin
//
//  Created by adobada on 4/3/24.
//

import SwiftUI

struct BoutiqueListScreen: View {
    
    init() { NavBar.configureAppearance() }
    
    @StateObject private var viewModel = BoutiqueViewModel()
    @EnvironmentObject private var locationManager: LocationManager
    
    var body: some View {
        
        NavigationStack {
            if viewModel.isLoading {
                LoadingView()
            } else {
                ZStack {
                    Color(.appPrimary).ignoresSafeArea()
                    VStack {
                        Text(ListScreenHeader.text).applyJPHeader()
                        ScrollView {
                            LazyVStack {
                                ForEach(locationManager.locations) { boutiqueLocation in
                                    NavigationLink(value: boutiqueLocation) {
                                        BoutiqueCellView(boutiqueLocation: boutiqueLocation)
                                            .foregroundStyle(.appAccent)
                                    }
                                }
                            }
                        }
                        .padding()
                        .navigationDestination(for: UnitedStatesBoutique.self) { boutique in
                            BoutiqueDetailScreen(boutiqueLocation: boutique)
                        // TODO: Filter by state, search bar
                        }
                    }
                }
                .alert(item: $viewModel.alertItem) { alertItem in
                    Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
                }
                .onAppear {
                    if locationManager.locations.isEmpty { viewModel.getLocations(for: locationManager) }
                }
            }
        }
        .tint(.appAccent)
    }
}

#Preview {
    BoutiqueListScreen()
        .environmentObject(LocationManager())
}
