//
//  View+Ext.swift
//  JingPin
//
//  Created by adobada on 4/12/24.
//

import SwiftUI

extension View {
    
    func createCustomTextfield() -> some View {
        self.modifier(TextFieldSubmissionStyle())
    }
}

