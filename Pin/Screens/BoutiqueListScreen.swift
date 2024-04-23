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
    
    @Environment(BoutiqueManager.self) private var boutiqueManager
    @State private var viewModel = BoutiqueViewModel()
    
    var filterResults: [UnitedStatesBoutique] {
        viewModel.selectedState == .allStates ? searchResults : boutiqueManager.locations.filter { $0.state == viewModel.selectedState.rawValue }
    }
    
    var searchResults: [UnitedStatesBoutique] {
        viewModel.searchText.isEmpty ? boutiqueManager.locations : boutiqueManager.locations.filter { $0.name.localizedCaseInsensitiveContains(viewModel.searchText) }
    }
    
    var body: some View {
        
        NavigationStack {
            if viewModel.isLoading {
                LoadingView()
            } else {
                ZStack {
                    Color(.mainScreenBackground).ignoresSafeArea()
                    // VStack for the whole screen
                    VStack {
                        // Search and filter icon
                        HStack {
                            Spacer()
                            Button {
                                viewModel.isSearchTextfieldVisible.toggle()
                            } label: {
                                Image(systemName: "magnifyingglass")
                            }
                            
                            Picker("", selection: $viewModel.selectedState) {
                                ForEach(USState.allCases) { state in
                                    Text(state.state)
                                        .applyJPBody(.mainScreenAccent)
                                        .tag(state)
                                }
                            }
                        }
                        if viewModel.isSearchTextfieldVisible {
                            TextField("Search boutique", text: $viewModel.searchText)
                                .applyJPTextfield()
                                .transition(.opacity)
                        }
                        
                        // Start of scrollview to display boutiques
                        ScrollView {
                            LazyVStack {
                                ForEach(filterResults) { boutique in
                                    NavigationLink(value: boutique) {
                                        BoutiqueCellView(boutiqueLocation: boutique)
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
        .environment(BoutiqueManager())
}
