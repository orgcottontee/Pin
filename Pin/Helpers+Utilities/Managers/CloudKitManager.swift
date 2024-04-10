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
