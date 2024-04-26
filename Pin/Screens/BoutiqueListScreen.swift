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
    
    var body: some View {
        if !viewModel.isLoading {
            NavigationStack {
                ZStack {
                    Color(.MainScreen.background).ignoresSafeArea()
                    // VStack for the whole screen
                    VStack {
                        // Search and filter icon
                        HStack {
                            Spacer()
                            Button {
                                withAnimation(.smooth) {
                                    viewModel.isSearchTextfieldVisible.toggle()
                                }
                            } label: {
                                Label("Search", systemImage: viewModel.isSearchTextfieldVisible ? ListScreenConstant.activeSearchIcon : ListScreenConstant.searchIcon)
                                    .labelStyle(.iconOnly)
                                    .applyJPBody(.App.accent)
                            }
                            
                            
                            Picker("Filter by State", selection: $viewModel.selectedState) {
                                ForEach(USState.allCases) { state in
                                    Text(state.state)
                                        .tag(state)
                                }
                            }
                            
                        }
                        if viewModel.isSearchTextfieldVisible {
                            TextField("Search boutique", text: $viewModel.searchText)
                                .applyJPTextfield()
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
                        }
                    }
                }
                .onAppear {
                    if boutiqueManager.locations.isEmpty { viewModel.getUSBoutiques(for: boutiqueManager) }
                }
            }
            .tint(.App.accent)
        } else {
            ProgressView()
                .alert(isPresented: $viewModel.hasError,
                       error: viewModel.jingPinError) {
                    Button("Retry") {
                        if boutiqueManager.locations.isEmpty { viewModel.getUSBoutiques(for: boutiqueManager) }
                    }
                }
        }
    }
    
    private var filterResults: [UnitedStatesBoutique] {
        viewModel.selectedState == .allStates ? searchResults : boutiqueManager.locations.filter { $0.state == viewModel.selectedState.rawValue }
    }
    
    private var searchResults: [UnitedStatesBoutique] {
        viewModel.searchText.isEmpty ? boutiqueManager.locations : boutiqueManager.locations.filter { $0.name.localizedCaseInsensitiveContains(viewModel.searchText) }
    }
}

#Preview {
    BoutiqueListScreen()
        .environment(BoutiqueManager())
}
