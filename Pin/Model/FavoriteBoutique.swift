//
//  FavoriteBoutique.swift
//  JingPin
//
//  Created by adobada on 4/17/24.
//

import Foundation
import CloudKit

struct FavoriteBoutique: Identifiable {
    
    static let kName = "name"
    static let kCity = "city"
    static let kState = "state"
    static let kShortURL = "shortURL"
    static let kWebsite = "website"
    
    let id: CKRecord.ID
    let name: String
    let city: String
    let state: String
    let shortURL: String
    let website: String
    
    init(record: CKRecord) {
        id = record.recordID
        name = record[FavoriteBoutique.kName] as? String ?? "N/A"
        city = record[FavoriteBoutique.kCity] as? String ?? "N/A"
        state = record[FavoriteBoutique.kState] as? String ?? "N/A"
        shortURL = record[FavoriteBoutique.kShortURL] as? String ?? "N/A"
        website = record[FavoriteBoutique.kWebsite] as? String ?? "N/A"
    }
}

extension FavoriteBoutique {
    var record: CKRecord {
        let favoriteRecord = CKRecord(recordType: RecordType.favoriteBoutique)
        favoriteRecord[FavoriteBoutique.kName] = name
        favoriteRecord[FavoriteBoutique.kCity] = city
        favoriteRecord[FavoriteBoutique.kState] = state
        favoriteRecord[FavoriteBoutique.kShortURL] = shortURL
        favoriteRecord[FavoriteBoutique.kWebsite] = website
        return favoriteRecord
    }
}
