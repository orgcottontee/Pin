//
//  PinLocation.swift
//  Pin
//
//  Created by adobada on 4/5/24.
//

import CloudKit

struct PinLocation {
    
    static let kAddress = "address"
    static let kBrandAsset = "brandAsset"
    static let kBrandStory = "brandStory"
    static let kCategories = "categories"
    static let kCity = "city"
    static let kCountry = "country"
    static let kLocation = "location"
    static let kName = "name"
    static let kPostalCode = "postalCode"
    static let kState = "state"
    static let kWebsiteURL = "websiteURL"
    
    let ckRecordID: CKRecord.ID
    let address: String
    let brandAsset: CKAsset! // Will handle nil cases with default images
    let brandStory: String
    let categories: [String]
    let city: String
    let country: String
    let location: CLLocation
    let name: String
    let postalCode: Int
    let state: String
    let websiteURL: String
    
    // Create our own init that takes in a CKRecord because this is what we get back when we make a call to CloudKit. Client-side's responsibility to convert the CKRecord into our custom PinLocation
    init(record: CKRecord) {
        ckRecordID = record.recordID
        address = record[PinLocation.kAddress] as? String ?? "N/A"
        brandAsset = record[PinLocation.kBrandAsset] as? CKAsset
        brandStory = record[PinLocation.kBrandStory] as? String ?? "N/A"
        categories = record[PinLocation.kCategories] as? [String] ?? []
        city = record[PinLocation.kCity] as? String ?? "N/A"
        country = record[PinLocation.kCountry] as? String ?? "N/A"
        location = record[PinLocation.kLocation] as? CLLocation ?? CLLocation(latitude: 0, longitude: 0)
        name = record[PinLocation.kName] as? String ?? "N/A"
        postalCode = record[PinLocation.kPostalCode] as? Int ?? 00000
        state = record[PinLocation.kState] as? String ?? "N/A"
        websiteURL = record[PinLocation.kWebsiteURL] as? String ?? "N/A"
    }
}
