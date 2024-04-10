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
    
//    static func getLocations() async throws -> [UnitedStatesBoutique] {
//        
//        let query = CKQuery(recordType: RecordType.USBoutique, predicate: NSPredicate(value: true))
//        let sortByName = NSSortDescriptor(key: UnitedStatesBoutique.kName, ascending: true)
//        query.sortDescriptors = [sortByName]
//        
//        let (matchResults, _) = try await CKContainer.default().publicCloudDatabase.records(matching: query)
//        let records = matchResults.compactMap { _, result in try? result.get() }
//        return records.map(UnitedStatesBoutique.init)
//    }
    
    static func getLocations(completed: @escaping (Result<[UnitedStatesBoutique], Error>) -> Void) {
        let sortByName = NSSortDescriptor(key: UnitedStatesBoutique.kName, ascending: true)
        let query = CKQuery(recordType: RecordType.USBoutique, predicate: NSPredicate(value: true))
        query.sortDescriptors = [sortByName]
    
        
        CKContainer.default().publicCloudDatabase.perform(query, inZoneWith: nil) { records, error in
            guard error == nil else {
                completed(.failure(error!))
                return
            }
            guard let records = records  else { return }
            
            let boutiqueLocations = records.map { $0.convertToUnitedStatesBoutique() }
            
            completed(.success(boutiqueLocations))
        }
    }
}
