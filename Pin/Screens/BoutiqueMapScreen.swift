//
//  BoutiqueMapScreen.swift
//  Pin
//
//  Created by adobada on 4/3/24.
//

import SwiftUI
import MapKit

struct BoutiqueMapScreen: View {
    
   @State private var camera: MapCameraPosition = .region(.init(center: CLLocationCoordinate2D(latitude: 40.721782,
                                                                                    longitude: -73.999781),
                                                  span: MKCoordinateSpan(latitudeDelta: 0.20,
                                                                         longitudeDelta: 0.20)
                                                     )
                                               )
    
    var body: some View {
        ZStack {
            Map(initialPosition: camera)
                .ignoresSafeArea()
        }
        .onAppear {
            CloudKitManager.getLocations { result in
                switch result {
                case .success(let locations):
                    print(locations)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}

#Preview {
    BoutiqueMapScreen()
}
