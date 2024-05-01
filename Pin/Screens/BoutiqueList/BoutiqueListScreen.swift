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
    
    private var filterResults: [UnitedStatesBoutique] {
        viewModel.selectedState == .allStates ? searchResults : boutiqueManager.locations.filter { $0.state == viewModel.selectedState.rawValue }
    }
    
    private var searchResults: [UnitedStatesBoutique] {
        viewModel.searchText.isEmpty ? boutiqueManager.locations : boutiqueManager.locations.filter { $0.name.localizedCaseInsensitiveContains(viewModel.searchText) }
    }
    
    var body: some View {
        if !viewModel.isLoading {
            NavigationStack {
                ZStack {
                    Color(.App.background).ignoresSafeArea()
                    VStack(alignment: .leading) {
                        SearchFilterTitleView(isSearchTextfieldVisible: $viewModel.isSearchTextfieldVisible,
                                         selectedState: $viewModel.selectedState,
                                         searchText: $viewModel.searchText)
                        HeaderView(headerText: ListScreenConstant.header)
                        ListView(filterResults: filterResults)
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
                .alert(item: $viewModel.alertItem) { alertItem in
                    Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
                }
        }
    }
}

#Preview {
    BoutiqueListScreen()
        .environment(BoutiqueManager())
}

fileprivate struct HeaderView: View {
    
    let headerText: String
    
    var body: some View {
        Text(headerText)
            .applyJPHeader(.App.accent)
            .padding(.leading)
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
                    withAnimation(.smooth) {
                        isSearchTextfieldVisible.toggle()
                    }
                } label: {
                    Label("Search", systemImage: isSearchTextfieldVisible ? ListScreenConstant.activeSearchIcon : ListScreenConstant.searchIcon)
                        .labelStyle(.iconOnly)
                        .applyJPSubheader(.App.accent)
                }
                .padding(.horizontal)
            }
            if isSearchTextfieldVisible {
                TextField("Search boutique", text: $searchText)
                    .applyJPTextfield()
            }
            CustomPickerView(selectedState: $selectedState)
                .padding(.horizontal)
        }
        .padding(.top)
    }
}

fileprivate struct ListView: View {
    
    var filterResults: [UnitedStatesBoutique]
    
    var body: some View {
        ScrollView {
            LazyVStack {
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
                .padding(.top)
            }
        }
        .scrollIndicators(.hidden)
    }
}
