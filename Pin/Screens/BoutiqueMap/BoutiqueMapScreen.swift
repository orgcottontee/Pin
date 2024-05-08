//
//  BoutiqueMapScreen.swift
//  Pin
//
//  Created by adobada on 4/3/24.
//

import SwiftUI
import MapKit

struct BoutiqueMapScreen: View {
    
    @Environment(NetworkMonitor.self) private var networkMonitor
    @Environment(BoutiqueManager.self) private var boutiqueManager
    @State private var isShowingDetailView: Bool = false
    
    var body: some View {
        if networkMonitor.isConnected {
            ZStack(alignment: .top) {
                Map {
                    ForEach(boutiqueManager.locations) { boutique in
                        Annotation(boutique.name, coordinate: boutique.location.coordinate) {
                            LogoView(image: boutique.squareLogo, frameWidth: 30)
                                .clipShape(RoundedRectangle(cornerRadius: 4))
                                .onTapGesture {
                                    boutiqueManager.selectedLocation = boutique
                                    isShowingDetailView = true
                                }
                        }
                    }
                }
                .ignoresSafeArea()
                .mapStyle(.standard)
            }
            .sheet(isPresented: $isShowingDetailView) {
                // Force unwrapping because we are assigning the value at the immediate previous step. If I add more code in the future in between setting the value, then definitely should unwrap safely
                NavigationStack {
                    BoutiqueDetailScreen(viewModel: BoutiqueDetailViewModel(boutiqueLocation: boutiqueManager.selectedLocation!))
                        .toolbar {
                            ToolbarItem(placement: .topBarLeading) {
                                Button {
                                    isShowingDetailView = false
                                } label: {
                                    XDismissButtonView()
                                }
                            }
                        }
                }
            }
        } else {
            NetworkUnavailableView()
        }
    }
}

#Preview {
    BoutiqueMapScreen()
        .environment(BoutiqueManager())
}
