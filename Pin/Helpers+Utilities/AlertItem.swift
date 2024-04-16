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
    
    static let unableToGetLocations = AlertItem(title: Text("Locations Error"), 
                                                message: Text("Unable to retrieve locations at this time. Please try again later."),
                                                dismissButton: .default(Text("Ok")))
    
    // MARK: - User boutique submission
    
    static let incompleteForm = AlertItem(title: Text("Incomplete Form"), 
                                          message: Text("Please fill in all fields to submit your response."),
                                          dismissButton: .default(Text("Ok")))
    
    static let submissionSuccess = AlertItem(title: Text("Success!"),
                                             message: Text("Thanks for letting us know"),
                                             dismissButton: .default(Text("Ok")))
    
    static let submissionFail = AlertItem(title: Text("Error submitting"),
                                          message: Text("We could not complete the submission at this time. Please check that you're logged into iCloud."),
                                          dismissButton: .default(Text("Try again")))
}
