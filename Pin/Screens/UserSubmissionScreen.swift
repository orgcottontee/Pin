//
//  UserSubmissionScreen.swift
//  JingPin
//
//  Created by adobada on 4/12/24.
//

import SwiftUI
import CloudKit

struct UserSubmissionScreen: View {
    
    @StateObject private var viewModel = UserSubmissionViewModel()
    @FocusState private var focusedTextField: FocusTextField?
    
    enum FocusTextField { case name, country, website }

    var body: some View {
        ZStack {
            Color.appPrimary.ignoresSafeArea()
            VStack(alignment: .leading) {
                Spacer()
                Text(SubmissionScreenConstant.instructions)
                    .font(.custom(BaskervilleFont.regular, size: 14))
                    .kerning(1.2)
                    .padding(.horizontal)
                TextField(SubmissionScreenConstant.namePlaceholder, text: $viewModel.boutiqueName)
                    .focused($focusedTextField, equals: .name)
                    .onSubmit { focusedTextField = .country }
                    .submitLabel(.next)
                    .createCustomTextfield()
                TextField(SubmissionScreenConstant.countryPlaceholder, text: $viewModel.country)
                    .focused($focusedTextField, equals: .country)
                    .onSubmit { focusedTextField = .website }
                    .submitLabel(.next)
                    .createCustomTextfield()
                    .autocorrectionDisabled(false)
                TextField(SubmissionScreenConstant.websitePlaceholder, text: $viewModel.website)
                    .focused($focusedTextField, equals: .website)
                    .submitLabel(.done)
                    .onSubmit { focusedTextField = nil }
                    .createCustomTextfield()
                Spacer()
                Button {
                    Task {
                        try await viewModel.submitSubmission()
                    }
                } label: {
                    ActionButtonView(buttonText: "Submit")
                        .padding(.bottom)
                }
            }
        }
        .onTapGesture { focusedTextField = nil }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
    }
}

#Preview {
    UserSubmissionScreen()
}
