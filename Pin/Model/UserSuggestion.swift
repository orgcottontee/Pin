//
//  UserSuggestion.swift
//  Pin
//
//  Created by adobada on 4/5/24.
//

import CloudKit

struct UserSuggestion {
    static let kSuggestionText = "suggestionText"
    
    let suggestionText: String
    
    init(record: CKRecord) {
        suggestionText = record[UserSuggestion.kSuggestionText] as? String ?? "N/A"
    }
    
    // TODO: Create an extension for init when user submits a suggestion, turn it into a CKRecord, and send it to Cloudkit
}
