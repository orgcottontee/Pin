//
//  AlertItem.swift
//  Pin
//
//  Created by adobada on 4/10/24.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    static let unableToGetLocations = AlertItem(title: Text("Locations Error"), message: Text("Unable to retrieve locations at this time. Please try again later."), dismissButton: .default(Text("Ok")))
}
