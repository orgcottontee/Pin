//
//  CKAsset+Ext.swift
//  Pin
//
//  Created by adobada on 4/10/24.
//

import UIKit
import CloudKit

extension CKAsset {
    
    func converToImage(in dimension: ImageDimension) -> UIImage {
        guard let fileURL = self.fileURL else { return dimension.placeholder }
        
        do {
            let data = try Data(contentsOf: fileURL)
            return UIImage(data: data) ?? dimension.placeholder
        } catch {
            return dimension.placeholder
        }
    }
}
