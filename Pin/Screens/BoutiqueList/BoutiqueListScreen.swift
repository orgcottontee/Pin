//
//  BoutiqueListScreen.swift
//  Pin
//
//  Created by adobada on 4/3/24.
//

import SwiftUI

struct BoutiqueListScreen: View {
    
    @Environment(NetworkMonitor.self) private var networkMonitor
    @Environment(BoutiqueManager.self) private var boutiqueManager
    @State private var viewModel = BoutiqueViewModel()
    @State private var isShowingAlert: Bool = false
    
    private var filterResults: [UnitedStatesBoutique] {
        viewModel.selectedState == .allStates ? searchResults : boutiqueManager.locations.filter { $0.state == viewModel.selectedState.rawValue }
    }
    
    private var searchResults: [UnitedStatesBoutique] {
        viewModel.searchText.isEmpty ? boutiqueManager.locations : boutiqueManager.locations.filter { $0.name.localizedCaseInsensitiveContains(viewModel.searchText) }
    }
    
    var body: some View {
        if !networkMonitor.isConnected {
            NetworkUnavailableView()
        } else {
            if !viewModel.isLoading {
                BoutiqueDisplayView(isSearchTextfieldVisible: $viewModel.isSearchTextfieldVisible,
                                    selectedState: $viewModel.selectedState,
                                    searchText: $viewModel.searchText,
                                    filterResults: filterResults)
                .onAppear {
                    if boutiqueManager.locations.isEmpty { viewModel.getUSBoutiques(for: boutiqueManager) }
                }
            } else {
                ProgressView()
                    .alert(item: $viewModel.alertItem) { alertItem in
                        Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
                    }
            }
        }
    }
}

#Preview {
    BoutiqueListScreen()
        .environment(BoutiqueManager())
        .environment(NetworkMonitor())
}
    
fileprivate struct BoutiqueDisplayView: View {
    
    @Binding var isSearchTextfieldVisible: Bool
    @Binding var selectedState: USState
    @Binding var searchText: String
    var filterResults: [UnitedStatesBoutique]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.App.background).ignoresSafeArea()
                VStack {
                    SearchFilterTitleView(isSearchTextfieldVisible: $isSearchTextfieldVisible,
                                          selectedState: $selectedState,
                                          searchText: $searchText)
                    CardStackView(filterResults: filterResults)
                        .navigationDestination(for: UnitedStatesBoutique.self) { boutique in
                            BoutiqueDetailScreen(viewModel: BoutiqueDetailViewModel(boutiqueLocation: boutique))
                                .toolbarRole(.editor)
                        }
                }
            }
        }
        .tint(.App.accent)
    }
}

fileprivate struct SearchFilterTitleView: View {
    
    @Binding var isSearchTextfieldVisible: Bool
    @Binding var selectedState: USState
    @Binding var searchText: String
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button {
                    withAnimation {
                        isSearchTextfieldVisible.toggle()
                        searchText = ""
                    }
                } label: {
                    Label("Search", systemImage: isSearchTextfieldVisible ? ListScreenConstant.activeSearchIcon : ListScreenConstant.searchIcon)
                        .labelStyle(.iconOnly)
                        .applyJPSubheader(.App.accent)
                }
                .padding()
            }
            if isSearchTextfieldVisible {
                TextField(ListScreenConstant.textfieldPlaceholder, text: $searchText)
                    .applyJPTextfield()
                    .padding(.horizontal)
            }
            CustomPickerView(selectedState: $selectedState)
                .padding(.horizontal)
        }
        .padding(.top)
    }
}

fileprivate struct CardStackView: View {
    
    var filterResults: [UnitedStatesBoutique]
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing: -60) {
                ForEach(filterResults) { boutique in
                    NavigationLink(value: boutique) {
                        BoutiqueCellView(boutiqueLocation: boutique)
                            .scrollTransition { content, phase in
                                content
                                    .opacity(phase.isIdentity ? 1 : 0)
                                    .scaleEffect(phase.isIdentity ? 1 : 0.50)
                                    .blur(radius: phase.isIdentity ? 0 : 10)
                            }
                    }
                }
            }
            .padding(.leading)
        }
        .scrollIndicators(.hidden)
    }
}

fileprivate struct FooterCountryView: View {
    var body: some View {
        
        Text("Location: United States")
            .applyJPFootnote()
        
    }
}
