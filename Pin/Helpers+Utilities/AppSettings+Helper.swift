//
//  AppSettings+Helper.swift
//  JingPin
//
//  Created by adobada on 4/30/24.
//

import UIKit

struct AppSettingsHelper {
    static func openSettings() {
        if let url = URL(string: "App-Prefs:root=ACCOUNT_SETTINGS") {
            UIApplication.shared.open(url)
        }
    }
}
