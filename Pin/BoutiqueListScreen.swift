//
//  BoutiqueListScreen.swift
//  Pin
//
//  Created by adobada on 4/3/24.
//

import SwiftUI

struct BoutiqueListScreen: View {
    
    init() { NavBar.configureAppearance() }
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                Color(.brandPrimary)
                    .ignoresSafeArea()
                ScrollView {
                    LazyVStack(spacing: 40) {
                        ForEach(0..<20) { boutique in
                            NavigationLink(destination: BoutiqueDetailScreen()) {
                                BoutiqueCellView()
                                    .foregroundStyle(.brandAccent)
                            }
                        }
                    }
                }
                .padding()
                //                .padding()
                //                .toolbar {
                //                    ToolbarItem {
                //                        Menu {
                //                            Picker("", selection: $viewModel.filterStatus) {
                //                                ForEach(Constants.USState.allCases, id: \.id) { state in
                //                                    Text(state.stateAbbreviation)
                //                                        .tag(state)
                //                                }
                //                            }
                //
                //                        } label: {
                //                            HStack {
                //                                Text("Filter by State")
                //                                    .font(.custom(BaskervilleFont.regular, size: 14))
                //                                    .kerning(2.0)
                //                                Image(systemName: "line.3.horizontal.decrease.circle")
                //                            }
                //                            .foregroundStyle(.accent)
                //                        }
                //                    }
                //                }
                //                .navigationDestination(for: BoutiqueResponse.self) { boutique in
                //                    BoutiqueDetailScreen(boutique: boutique)
                //                }
                //            }
                //            .task {
                //                do {
                //                    try await viewModel.loadBoutiques()
                //                } catch {
                //                    print("---Error from BoutiqueListScreen \(error.localizedDescription)---")
                //                }
                //            }
                //            .alert(isPresented: $viewModel.hasError,
                //                   error: viewModel.boutiqueError) {
                //                Button("Retry") {
                //                    Task {  try await viewModel.loadBoutiques() }
                //                }
                //                Button("Cancel", role: .cancel) {
                //                    print("Handle action for cancelled alert")
                //                }
                //
                //            }
                //                   .searchable(text: $viewModel.searchText,
                //                               placement: .navigationBarDrawer(displayMode: .always),
                //                               prompt: "Search boutique name..."
                //                   )
                //        }
            }
        }
    }
}

#Preview {
    BoutiqueListScreen()
}
