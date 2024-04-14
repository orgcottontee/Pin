//
//  BoutiqueCellView.swift
//  Pin
//
//  Created by adobada on 4/3/24.
//

import SwiftUI

struct BoutiqueCellView: View {
    
    var boutiqueLocation: UnitedStatesBoutique
    
    var body: some View {
        
            VStack(alignment: .leading) {
                LogoView(image: boutiqueLocation.createSquareLogo(),
                         frameWidth: 150)
                HStack {
                    VStack(alignment: .leading) {
                        CityView(city: boutiqueLocation.city)
                        StateView(state: boutiqueLocation.state)
                    }
                    Spacer()
                }
                .frame(width: 150)
            }
            .padding(.bottom, 30)
        
    }
}

#Preview {
    BoutiqueCellView(boutiqueLocation: UnitedStatesBoutique(record: MockData.boutiqueLocation))
}

fileprivate struct CityView: View {
    
    var city: String
    
    var body: some View {
        
        Text("\(city),")
            .font(.custom(UniversFont.light, size: 14))
            .kerning(1.8)
    }
}

fileprivate struct StateView: View {
    
    var state: String
    
    var body: some View {
        
        Text("\(state)")
            .font(.custom(UniversFont.light, size: 14))
            .kerning(1.8)
            .minimumScaleFactor(0.75)
            .truncationMode(.tail)
    }
}

