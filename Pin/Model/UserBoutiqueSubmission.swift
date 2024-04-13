//
//  UserBoutiqueSubmission.swift
//  JingPin
//
//  Created by adobada on 4/12/24.
//

import CloudKit
import Foundation

struct UserBoutiqueSubmission {
    
    static let kName = "name"
    static let kCountry = "country"
    static let kWebsite = "website"
    
    var id: CKRecord.ID?
    let name: String
    let country: String
    let website: String
    
}

extension UserBoutiqueSubmission {
    init?(record: CKRecord) {
        guard let name = record[UserBoutiqueSubmission.kName] as? String,
              let country = record[UserBoutiqueSubmission.kCountry] as? String,
              let website = record[UserBoutiqueSubmission.kWebsite] as? String else { return nil }
        
        self.init(id: record.recordID, name: name, country: country, website: website)
    }
}

extension UserBoutiqueSubmission {
    var record: CKRecord {
        let record = CKRecord(recordType: "UserBoutiqueSubmission")
        record[UserBoutiqueSubmission.kName] = name
        record[UserBoutiqueSubmission.kCountry] = country
        record[UserBoutiqueSubmission.kWebsite] = website
        return record
    }
}
