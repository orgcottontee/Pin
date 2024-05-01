//
//  HapticManager.swift
//  JingPin
//
//  Created by adobada on 5/1/24.
//

import UIKit

struct HapticManager {
    
    static func playSuccess() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }
    
}
