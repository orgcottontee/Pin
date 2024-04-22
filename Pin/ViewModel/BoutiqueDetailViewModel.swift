//
//  BoutiqueDetailViewModel.swift
//  JingPin
//
//  Created by adobada on 4/16/24.
//

import Foundation
import MapKit
import CloudKit

final class BoutiqueDetailViewModel: ObservableObject {
    
    // MARK: - Properties
    
    let boutiqueLocation: UnitedStatesBoutique
    @Published var showSafari: Bool = false
    @Published var isFavorited: Bool = false
    private let container = CKContainer.default().privateCloudDatabase
    private var favoritedDictionary: [String: CKRecord.ID] = [:]
    
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
