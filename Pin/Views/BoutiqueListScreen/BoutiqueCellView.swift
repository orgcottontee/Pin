//
//  BoutiqueCellView.swift
//  Pin
//
//  Created by adobada on 4/3/24.
//

import SwiftUI

struct BoutiqueCellView: View {
    
    var boutiqueLocation: UnitedStatesBoutique
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    
    var body: some View {
        
        VStack(spacing: 10) {
            LogoView(image: boutiqueLocation.squareLogo, frameWidth: 220)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(color: .gray, radius: 4, x: 2, y: 2)
                .accessibilityLabel(Text(boutiqueLocation.name))
            Text("\(boutiqueLocation.city), \(boutiqueLocation.state)")
                .applyJPBody(.App.accent)
        }
        .padding()
    }
}

#Preview {
    BoutiqueCellView(boutiqueLocation: UnitedStatesBoutique(record: MockData.boutiqueLocation))
}
