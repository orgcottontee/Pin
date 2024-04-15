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
                         frameWidth: 160)
                .clipShape(RoundedRectangle(cornerRadius: 4))

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
            .applyJPBody()
    }
}

fileprivate struct StateView: View {
    
    var state: String
    
    var body: some View {
        Text("\(state)")
            .applyJPBody()
            .minimumScaleFactor(0.75)
            .truncationMode(.tail)
    }
}

