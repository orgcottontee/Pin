//
//  BoutiqueListScreen.swift
//  Pin
//
//  Created by adobada on 4/3/24.
//

import SwiftUI

struct BoutiqueListScreen: View {
    
    init() { NavBar.configureAppearance() }
    
    @State private var locations: [UnitedStatesBoutique] = [UnitedStatesBoutique(record: MockData.boutiqueLocation)]
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                Color(.brandPrimary)
                    .ignoresSafeArea()
                ScrollView {
                    LazyVStack(spacing: 40) {
                        ForEach(locations, id: \.ckRecordID) { boutiqueLocation in
                            NavigationLink(destination: BoutiqueDetailScreen(boutiqueLocation: boutiqueLocation)) {
                                BoutiqueCellView(boutiqueLocation: boutiqueLocation)
                                    .foregroundStyle(.brandAccent)
                            }
                        }
                    }
                }
                .padding()
            }
        }
        .tint(.brandAccent)
    }
}

#Preview {
    BoutiqueListScreen()
}
