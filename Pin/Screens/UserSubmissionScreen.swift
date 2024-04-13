//
//  UserSubmissionScreen.swift
//  JingPin
//
//  Created by adobada on 4/12/24.
//

import SwiftUI

struct UserSubmissionScreen: View {
    
    @State private var boutiqueName = ""
    @State private var country = ""
    @State private var website = ""
    
    var body: some View {
        ZStack {
            Color.appPrimary
                .ignoresSafeArea()
            VStack(spacing: 10) {
                Spacer()
                TextField("Enter Boutique Name", text: $boutiqueName)
                    .createCustomTextfield()
                TextField("Enter Country", text: $country)
                    .createCustomTextfield()
                TextField("Enter Website", text: $website)
                    .createCustomTextfield()
                Spacer()
                ActionButtonView(buttonText: "Submit")
                    .padding(.vertical)
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    UserSubmissionScreen()
}
