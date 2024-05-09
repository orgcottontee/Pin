//
//  MockData.swift
//  Pin
//
//  Created by adobada on 4/5/24.
//

import CloudKit

struct MockData {
    static var boutiqueLocation: CKRecord {
        let record = CKRecord(recordType: RecordType.USBoutique)
        
        record[UnitedStatesBoutique.kAddress] = "1257 N La Brea Ave"
        record[UnitedStatesBoutique.kBoutiqueStory] = "August is an amalgamation of streetwear, sneakers, art, music and literature. "
        record[UnitedStatesBoutique.kCategories] = ["Kitchenware", "Homegoods", "Vintage", "Media", "Lifestyle"]
        record[UnitedStatesBoutique.kCity] = "Los Angeles"
        record[UnitedStatesBoutique.kLocation] = CLLocation(latitude: 34.094924401599656, longitude: -118.34434975940319)
        record[UnitedStatesBoutique.kName] = "Front General Store"
        record[UnitedStatesBoutique.kShortURL] = "shopandson.com"
        record[UnitedStatesBoutique.kState] = "California"
        record[UnitedStatesBoutique.kWebsiteURL] = "https://toirokitchen.com/"
        record[UnitedStatesBoutique.kZipCode] = 90038

        return record
    }
}
