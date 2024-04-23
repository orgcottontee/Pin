//
//  BoutiqueMapScreen.swift
//  Pin
//
//  Created by adobada on 4/3/24.
//

import SwiftUI
import MapKit

struct BoutiqueMapScreen: View {
    
    private var viewModel = BoutiqueViewModel()
    @Environment(BoutiqueManager.self) private var manager

    var body: some View {
        ZStack(alignment: .top) {
            Map {
                ForEach(manager.locations) { boutique in
                    Annotation(boutique.name, coordinate: boutique.location.coordinate) {
                        LogoView(image: boutique.createSquareLogo(), frameWidth: 30)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
            }
            .ignoresSafeArea()
            .mapStyle(.standard)
        }
    }
}

#Preview {
    BoutiqueMapScreen()
        .environment(BoutiqueManager())
}
