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
    @Environment(NetworkMonitor.self) private var networkMonitor
    
    enum FocusTextField { case name, country, website }
    
    var body: some View {
        
        if networkMonitor.isConnected {
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
                        ActionButtonView(smallText: "Submit", icon: "paperplane")
                            .accessibilityLabel("Submit your boutique suggestion")
                    }
                }
                .padding()
                if viewModel.isLoading { LoadingView() }
            }
            .onTapGesture { focusedTextField = nil }
            .alert(isPresented: $viewModel.hasError, error: viewModel.jingPinError) { error in
                Button("Try again") {
                    viewModel.hasError = false
                }
            } message: { error in
                Text(error.failureReason)
            }
            .alert("Thanks for your submission!", isPresented: $viewModel.hasAlert) {
                Button("Submit more") {
                    viewModel.hasAlert = false
                }
            }
        } else {
            NetworkUnavailableView()
        }
    }
}

#Preview {
    UserSubmissionScreen()
        .environment(NetworkMonitor())
}
