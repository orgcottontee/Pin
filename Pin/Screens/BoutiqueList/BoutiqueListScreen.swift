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
    
    // MARK: - Search & filter properties
    
    private var filterResults: [UnitedStatesBoutique] {
        viewModel.selectedState == .allStates ? searchResults : boutiqueManager.locations.filter { $0.state == viewModel.selectedState.rawValue }
    }
    
    private var searchResults: [UnitedStatesBoutique] {
        viewModel.searchText.isEmpty ? boutiqueManager.locations : boutiqueManager.locations.filter { $0.name.localizedCaseInsensitiveContains(viewModel.searchText) }
    }
    
    // MARK: - Main view
    
    var body: some View {
        if !networkMonitor.isConnected {
            NetworkUnavailableView()
        } else {
            NavigationStack {
                ZStack {
                    Color.App.background.ignoresSafeArea()
                    BoutiqueDisplayView(isSearchTextfieldVisible: $viewModel.isSearchTextfieldVisible,
                                        selectedState: $viewModel.selectedState,
                                        searchText: $viewModel.searchText,
                                        filterResults: filterResults)
                    .onAppear {
                        if boutiqueManager.locations.isEmpty { viewModel.getUSBoutiques(for: boutiqueManager) }
                    }
                    .applyOnFirstAppear {
                        Task {
                            await viewModel.fetchAccountStatus()
                            if viewModel.accountStatus != .available {
                                viewModel.isAccountStatusAlertShowing = true
                            }
                        }
                    }
                    .alert("Please log into your iCloud", isPresented: $viewModel.isAccountStatusAlertShowing) {
                        Button("Continue to app", role: .cancel, action: {})
                    } message: {
                        Text("You can still explore all boutiques, but you will not be able to perform certain actions.")
                    }
                    .alert(isPresented: $viewModel.hasError,
                           error: viewModel.jingPinError) { error in
                        Button {
                            if boutiqueManager.locations.isEmpty { viewModel.getUSBoutiques(for: boutiqueManager) }
                        } label: {
                            Text("Retry")
                        }
                    } message: { errorMessage in
                        Text(errorMessage.failureReason)
                    }
                    
                    if viewModel.isLoading { LoadingView() }
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

fileprivate struct SearchFilterTitleView: View {
    
    @Binding var isSearchTextfieldVisible: Bool
    @Binding var selectedState: USState
    @Binding var searchText: String
    
    // when filterResult is filtered to a specific state, reset it when the user clicks on the search button
    // when user clicks on a state to filter, reset search button
    
    var body: some View {
        VStack {
            HStack(spacing: 20) {
                Button {
                    withAnimation {
                        isSearchTextfieldVisible.toggle()
                        searchText = ""
                    }
                } label: {
                    IconButtonView(icon: isSearchTextfieldVisible ? ListScreenConstant.activeSearchIcon : ListScreenConstant.searchIcon, color: .App.accent)
                }
                USStatePickerView(selectedState: $selectedState)
            }
            .padding(.vertical)
            if isSearchTextfieldVisible {
               
                    TextField(ListScreenConstant.textfieldPlaceholder, text: $searchText)
                        .applyJPTextfield()
               
            }
        }
        .padding()
    }
}

fileprivate struct CardStackView: View {
    
    var filterResults: [UnitedStatesBoutique]
    
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading) {
                ForEach(filterResults) { boutique in
                    NavigationLink(value: boutique) {
                        BoutiqueCellView(boutiqueLocation: boutique)
                            .scrollTransition { content, phase in
                                content
                                    .opacity(phase.isIdentity ? 1 : 0)
                                    .scaleEffect(phase.isIdentity ? 1 : 0.25)
                                    .blur(radius: phase.isIdentity ? 0 : 5)
                            }
                    }
                }
            }
            .padding()
        }
        .scrollIndicators(.hidden)
    }
}

//fileprivate struct FooterCountryView: View {
//    var body: some View {
//        Text("Location: United States")
//            .applyJPFootnote()
//    }
//}
