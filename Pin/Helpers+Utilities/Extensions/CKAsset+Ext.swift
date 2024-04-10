//
//  CKAsset+Ext.swift
//  Pin
//
//  Created by adobada on 4/10/24.
//

import CloudKit
import UIKit

extension CKAsset {
    
    func convertToImage(in dimension: ImageDimension) -> UIImage {
        let placeholder = ImageDimension.getPlaceHolder(for: dimension)
        
        guard let fileURL = self.fileURL else { return placeholder } // Every CKAsset is a data at a file url - ensure we obtain a file url
        
        do {
            let data = try Data(contentsOf: fileURL) // Try creating data from the contents of the file url we obtained, which is the CKAsset
            return UIImage(data: data) ?? placeholder // Use data to create an UIImage. Can fail too, so fall back to app placeholder
        } catch {
            return placeholder // If all fails, return our app placeholder
        }
    }
}
