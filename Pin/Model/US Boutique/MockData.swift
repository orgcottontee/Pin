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
        
        record[UnitedStatesBoutique.kAddress] = "1234 Fashion Drive"
        record[UnitedStatesBoutique.kBoutiqueStory] = "We express ourselves through what we wear, and we want to extend this expression to you. Inspired by the MUKEI movement, we too wanted to challenge trends and societal norms, starting with how the fashion world and clothing are handled today. Classic yet timeless. Simple yet bold. Quality over quantity. Our selections can be worn on anyone but are chosen with a woman's body in mind. Most importantly, we are here to provide a means of self-expression through thoughtfully crafted goods."
        record[UnitedStatesBoutique.kCategories] = ["Apparel"]
        record[UnitedStatesBoutique.kCity] = "San Diego"
        record[UnitedStatesBoutique.kLocation] = CLLocation(latitude: 24.972273, longitude: 121.257300)
        record[UnitedStatesBoutique.kName] = "MUKAE MÜZ"
        record[UnitedStatesBoutique.kShortURL] = "mukaemuz.co"
        record[UnitedStatesBoutique.kState] = "California"
        record[UnitedStatesBoutique.kWebsiteURL] = "https://www.mukaemuz.co/"
        record[UnitedStatesBoutique.kZipCode] = 32066

        return record
    }
}
