//
//  UserBoutiqueSubmission.swift
//  JingPin
//
//  Created by adobada on 4/12/24.
//

import CloudKit

struct UserBoutiqueSubmission {
    
    static let kName = "name"
    static let kCountry = "country"
    static let kWebsite = "website"
    
    let recordID: CKRecord.ID?
    let name: String
    let country: String
    let website: String
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
