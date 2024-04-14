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
                    Color(.appPrimary)
                        .ignoresSafeArea()
                    ScrollView {
                        LazyVStack {
                            ForEach(locationManager.locations) { boutiqueLocation in
                                NavigationLink(destination: BoutiqueDetailScreen(boutiqueLocation: boutiqueLocation)) {
                                    BoutiqueCellView(boutiqueLocation: boutiqueLocation)
                                        .foregroundStyle(.appAccent)
                                }
                            }
                        }
                    }
                    .padding()
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
