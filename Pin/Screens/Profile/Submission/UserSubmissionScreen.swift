//
//  UserSubmissionScreen.swift
//  JingPin
//
//  Created by adobada on 4/12/24.
//

import SwiftUI

struct UserSubmissionScreen: View {
    
    @State private var viewModel = UserSubmissionViewModel()
    @FocusState private var focusedTextField: FocusTextField?
    
    enum FocusTextField { case name, country, website }
    
    var body: some View {
        ZStack {
            Color.App.background.ignoresSafeArea()
            VStack(alignment: .leading) {
                Spacer()
                Text(SubmissionScreenConstant.instructions)
                    .applyJPBody(.App.accent)
                    .padding(.bottom)
                
                VStack {
                    TextField(SubmissionScreenConstant.namePlaceholder, text: $viewModel.boutiqueName)
                        .focused($focusedTextField, equals: .name)
                        .onSubmit { focusedTextField = .country }
                        .submitLabel(.next)
                        .applyJPTextfield()
                }
                .padding(.bottom)
                
                VStack {
                    TextField(SubmissionScreenConstant.countryPlaceholder, text: $viewModel.country)
                        .focused($focusedTextField, equals: .country)
                        .onSubmit { focusedTextField = .website }
                        .submitLabel(.next)
                        .applyJPTextfield()
                        .autocorrectionDisabled(false)
                }
                .padding(.bottom)
                
                VStack {
                    TextField(SubmissionScreenConstant.websitePlaceholder, text: $viewModel.website)
                        .focused($focusedTextField, equals: .website)
                        .submitLabel(.done)
                        .onSubmit { focusedTextField = nil }
                        .applyJPTextfield()
                }
                .padding(.bottom)
                
                Spacer()
                Button {
                    Task {
                        viewModel.submitSubmission()
                    }
                } label: {
                    ActionButtonView(buttonText: "Submit")
                }
            }
            .padding()
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
