//
//  UserSubmissionScreen.swift
//  JingPin
//
//  Created by adobada on 4/12/24.
//

import SwiftUI
import CloudKit

struct UserSubmissionScreen: View {
    
    @FocusState private var focusedTextField: FocusTextField?
    @State private var boutiqueName = ""
    @State private var country = ""
    @State private var website = ""
    @StateObject private var manager = UserSubmissionManager()
    @State private var alertItem: AlertItem?
    
    enum FocusTextField {
        case name, country, website
    }
    
    var body: some View {
        ZStack {
            Color.appPrimary
                .ignoresSafeArea()
            VStack(alignment: .leading) {
                Spacer()
                Text(SubmissionScreenConstant.instructions)
                    .font(.custom(BaskervilleFont.regular, size: 14))
                    .kerning(1.2)
                    .padding(.horizontal)
                TextField(SubmissionScreenConstant.namePlaceholder, text: $boutiqueName)
                    .focused($focusedTextField, equals: .name)
                    .onSubmit { focusedTextField = .country }
                    .submitLabel(.next)
                    .createCustomTextfield()
                TextField(SubmissionScreenConstant.countryPlaceholder, text: $country)
                    .focused($focusedTextField, equals: .country)
                    .onSubmit { focusedTextField = .website }
                    .submitLabel(.next)
                    .createCustomTextfield()
                    .autocorrectionDisabled(false)
                TextField(SubmissionScreenConstant.websitePlaceholder, text: $website)
                    .focused($focusedTextField, equals: .website)
                    .submitLabel(.done)
                    .onSubmit { focusedTextField = nil }
                    .createCustomTextfield()
                Spacer()
                Button {
                    submitSubmission()
                    let submission = UserBoutiqueSubmission(name: boutiqueName, country: country, website: website)
                    Task {
                        try await manager.addUserSubmission(submission: submission)
                    }
                } label: {
                    ActionButtonView(buttonText: "Submit")
                        .padding(.bottom)
                }
            }
        }
        .onTapGesture { focusedTextField = nil }
        .alert(item: $alertItem) { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
    }
    
    func isCompletedForm() -> Bool {
         guard !boutiqueName.isEmpty, !country.isEmpty, !website.isEmpty else { return false }
         return true
    }
    
    func submitSubmission() {
        // Add logic to send to CloudKit
        focusedTextField = nil
        guard isCompletedForm() else {
            alertItem = AlertContext.incompleteForm
            return
        }
    }
}

#Preview {
    UserSubmissionScreen()
}

@MainActor
final class UserSubmissionManager: ObservableObject {
    
    private let container = CKContainer.default().publicCloudDatabase
    @Published private var submissionDictionary: [CKRecord.ID: UserBoutiqueSubmission] = [:]
    var submissions: [UserBoutiqueSubmission] {
        submissionDictionary.values.compactMap { $0 }
    }
    
    func addUserSubmission(submission: UserBoutiqueSubmission) async throws {
        let _ = try await container.save(submission.record)
    }
    // This will pull all submissions from every user since it is in the public database. I still need it in the public so I can see it and add to the app. How can I simplify it so that it just persists the boutique name text in a list? Maybe I can use userdefaults for this and when they save an existing boutique from CloudKit in their favorites
    
    func populateSubmissions() async throws {
        
        let query = CKQuery(recordType: RecordType.userSubmission, predicate: NSPredicate(value: true))
        query.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        let result = try await container.records(matching: query)
        let records = result.matchResults.compactMap { try? $0.1.get() }
        
        records.forEach { record in
            submissionDictionary[record.recordID] = UserBoutiqueSubmission(record: record)
        }
    }
    
}
