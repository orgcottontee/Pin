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
                    .applyJPBody(.appAccent)
                    .padding(.horizontal)
                TextField(SubmissionScreenConstant.namePlaceholder, text: $viewModel.boutiqueName)
                    .focused($focusedTextField, equals: .name)
                    .onSubmit { focusedTextField = .country }
                    .submitLabel(.next)
                    .applyJPTextfield()
                TextField(SubmissionScreenConstant.countryPlaceholder, text: $viewModel.country)
                    .focused($focusedTextField, equals: .country)
                    .onSubmit { focusedTextField = .website }
                    .submitLabel(.next)
                    .applyJPTextfield()
                    .autocorrectionDisabled(false)
                TextField(SubmissionScreenConstant.websitePlaceholder, text: $viewModel.website)
                    .focused($focusedTextField, equals: .website)
                    .submitLabel(.done)
                    .onSubmit { focusedTextField = nil }
                    .applyJPTextfield()
                Spacer()
                Button {
                    Task {
                        viewModel.submitSubmission()
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
