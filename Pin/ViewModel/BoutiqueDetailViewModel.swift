//
//  BoutiqueDetailViewModel.swift
//  JingPin
//
//  Created by adobada on 4/16/24.
//

import Foundation
import MapKit

@Observable
final class BoutiqueDetailViewModel {
    
    // MARK: - Properties
    
    let boutiqueLocation: UnitedStatesBoutique
    var showSafari: Bool = false
    var isFavorited: Bool = false
    
    // MARK: - Init
    
    init(boutiqueLocation: UnitedStatesBoutique) { self.boutiqueLocation = boutiqueLocation }
    
    // MARK: - Actions
    
    func openMaps() {
        let placemark = MKPlacemark(coordinate: boutiqueLocation.location.coordinate)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = boutiqueLocation.name
        
        mapItem.openInMaps(launchOptions: [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDefault])
    }
}
