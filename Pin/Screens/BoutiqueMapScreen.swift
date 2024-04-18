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
    @EnvironmentObject private var locationManager: BoutiqueManager
    
    var body: some View {
        ZStack(alignment: .top) {
            Map {
                ForEach(locationManager.locations) { boutique in
                    Annotation(boutique.name, coordinate: boutique.location.coordinate) {
                        LogoView(image: boutique.createSquareLogo(), frameWidth: 30)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
            }
            .ignoresSafeArea()
            .mapStyle(.standard)
        }
        .alert(item: $viewModel.alertItem, content: { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        })
    }
}

#Preview {
    BoutiqueMapScreen()
        .environmentObject(BoutiqueManager())
}
