//
//  PinLocation.swift
//  Pin
//
//  Created by adobada on 4/5/24.
//

import CloudKit
import UIKit

struct UnitedStatesBoutique: Identifiable, Hashable {
    
    static let kAddress = "address"
    static let kBoutiqueAsset = "boutiqueAsset"
    static let kBoutiqueStory = "boutiqueStory"
    static let kCategories = "categories"
    static let kCity = "city"
    static let kLocation = "location"
    static let kLocationAsset = "locationAsset"
    static let kName = "name"
    static let kShortURL = "shortURL"
    static let kState = "state"
    static let kWebsiteURL = "websiteURL"
    static let kZipCode = "zipCode"
    
    let id: CKRecord.ID
    let address: String
    let boutiqueAsset: CKAsset!
    let boutiqueStory: String
    let categories: [String]
    let city: String
    let location: CLLocation
    let locationAsset: CKAsset!
    let name: String
    let shortURL: String
    let state: String
    let websiteURL: String
    let zipCode: Int
    
    // Create our own init that takes in a CKRecord because this is what we get back when we make a call to CloudKit. Client-side's responsibility to convert the CKRecord into our custom model
    init(record: CKRecord) {
        id = record.recordID
        address = record[UnitedStatesBoutique.kAddress] as? String ?? "N/A"
        boutiqueAsset = record[UnitedStatesBoutique.kBoutiqueAsset] as? CKAsset
        boutiqueStory = record[UnitedStatesBoutique.kBoutiqueStory] as? String ?? "N/A"
        categories = record[UnitedStatesBoutique.kCategories] as? [String] ?? []
        city = record[UnitedStatesBoutique.kCity] as? String ?? "N/A"
        location = record[UnitedStatesBoutique.kLocation] as? CLLocation ?? CLLocation(latitude: 0, longitude: 0)
        locationAsset = record[UnitedStatesBoutique.kLocationAsset] as? CKAsset
        name = record[UnitedStatesBoutique.kName] as? String ?? "N/A"
        shortURL = record[UnitedStatesBoutique.kShortURL] as? String ?? "N/A"
        state = record[UnitedStatesBoutique.kState] as? String ?? "N/A"
        websiteURL = record[UnitedStatesBoutique.kWebsiteURL] as? String ?? "N/A"
        zipCode = record[UnitedStatesBoutique.kZipCode] as? Int ?? 00000
    }
    
    func createSquareLogo() -> UIImage {
        guard let boutiqueAsset else { return PlaceholderImage.squareLogo }
        return boutiqueAsset.converToImage(in: .squareLogo)
    }
    
    func createBannerImage() -> UIImage {
        guard let locationAsset else { return PlaceholderImage.bannerImage }
        return locationAsset.converToImage(in: .bannerImage)
    }
}

//extension UnitedStatesBoutique {
//    var record: CKRecord {
//        let record = CKRecord(recordType: "FavoriteBoutique")
//        record[UnitedStatesBoutique.kName] = name
//       return record
//    }
//}
