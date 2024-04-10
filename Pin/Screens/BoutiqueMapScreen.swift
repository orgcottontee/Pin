//
//  BoutiqueMapScreen.swift
//  Pin
//
//  Created by adobada on 4/3/24.
//

import SwiftUI
import MapKit

struct BoutiqueMapScreen: View {
    
    @StateObject private var viewModel = BoutiqueViewModel()
    @EnvironmentObject private var locationManager: LocationManager
    
    var body: some View {
        ZStack {
            Map {
                ForEach(locationManager.locations) { boutique in
                    Marker(boutique.name, coordinate: boutique.location.coordinate)
                }
            }
            .ignoresSafeArea()
        }
        .alert(item: $viewModel.alertItem, content: { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        })
    }
}

#Preview {
    BoutiqueMapScreen()
}
