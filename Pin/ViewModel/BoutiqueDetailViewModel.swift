//
//  BoutiqueDetailViewModel.swift
//  JingPin
//
//  Created by adobada on 4/16/24.
//

import Foundation
import MapKit

final class BoutiqueDetailViewModel: ObservableObject {
    
    let boutiqueLocation: UnitedStatesBoutique
    @Published var showSafari: Bool = false
    @Published var isFavorited: Bool = false
    
    init(boutiqueLocation: UnitedStatesBoutique) {
        self.boutiqueLocation = boutiqueLocation
    }
    
    func openMaps() {
        let placemark = MKPlacemark(coordinate: boutiqueLocation.location.coordinate)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = boutiqueLocation.name
        
        mapItem.openInMaps(launchOptions: [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDefault])
    }
}
