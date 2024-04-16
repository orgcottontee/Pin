//
//  CloudKitManager.swift
//  Pin
//
//  Created by adobada on 4/6/24.
//

import CloudKit

final class CloudKitManager {
    
    static let shared = CloudKitManager()
    
    private init() { }
    
    let container = CKContainer.default()
    
    func getBoutiqueLocations() async throws -> [UnitedStatesBoutique] {
        let sortByName = NSSortDescriptor(key: UnitedStatesBoutique.kName, ascending: true)
        let query = CKQuery(recordType: RecordType.USBoutique, predicate: NSPredicate(value: true))
        query.sortDescriptors = [sortByName]
        
        let (matchResults, _) = try await container.publicCloudDatabase.records(matching: query)
        let records = matchResults.compactMap { _, result in try? result.get() }
        return records.map(UnitedStatesBoutique.init)
    }
}
