//
//  CKRecord+Ext.swift
//  Pin
//
//  Created by adobada on 4/10/24.
//

import CloudKit

extension CKRecord {
    
    func convertToUnitedStatesBoutique() -> UnitedStatesBoutique { UnitedStatesBoutique(record: self) }
}
